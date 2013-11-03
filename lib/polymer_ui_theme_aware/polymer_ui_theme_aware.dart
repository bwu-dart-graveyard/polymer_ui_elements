// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_theme_aware;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';

@CustomTag('polymer-ui-theme-aware')
class PolymerUiThemeAware extends PolymerElement {
  PolymerUiThemeAware.created() : super.created();

  final _logger = new Logger('PolymerUiThemeAware');

  @published String theme = '';
  
  void validateTheme() {
    _logger.finest('validateTheme');
    
    if (theme == null || theme.isEmpty) {
      var p = this;
      while (p != null && (theme == null || theme.isEmpty)) {
        if(p is HtmlElement) {
          var t = p.attributes['theme'];
          if (t != null) {
            theme = t;
          }
        }
        p = p.parent;
      }
    }
    
    if (this.theme != null && this.theme.isNotEmpty) {
      this.activeTheme = this.theme;
    }
  }
  
    String activeTheme = '';

    @override
    void enteredView() {
      _logger.finest('enteredView');
      
      this.validateTheme();
    }
    
    void themeChanged() {
      _logger.finest('themeChanged');
      
      this.activeTheme = this.theme;
    }
    
    void activeThemeChanged(String old) {
      _logger.finest('activeThemeChanged');
      
      this.classes.remove(old);
      this.classes.add(this.activeTheme);
    }
}
