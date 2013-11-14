// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_theme_aware;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
import 'polymer_ui.dart' as ui;

@CustomTag('polymer-ui-theme-aware')
class PolymerUiThemeAware extends PolymerElement {
  PolymerUiThemeAware.created() : super.created();

  final _logger = new Logger('PolymerUiThemeAware');

  @published String theme = '';
  
  String activeTheme = '';

  //ui.validateThemeFunc validateTheme = ui.validateTheme;
  
  @override
  void enteredView() {
    _logger.finest('enteredView');
    
    ui.validateTheme(this, theme, activeTheme);
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
