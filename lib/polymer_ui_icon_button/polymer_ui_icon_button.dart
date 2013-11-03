// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_icon_button;

import 'package:polymer/polymer.dart';
import 'package:polymer_ui_elements/polymer_ui_theme_aware/polymer_ui_theme_aware.dart';
import 'package:logging/logging.dart';

@CustomTag('polymer-ui-icon-button')
class PolymerUiIconButton extends PolymerUiThemeAware {
  PolymerUiIconButton.created() : super.created();

  final _logger = new Logger('PolymerUiIconButton');

  /**
   * The URL of an image for the icon.
   */
  @published String src = '';

  /**
   * If true, border is placed around the button to indicate
   * active state.
   */
  @published bool active = false;

  /**
   * Specifies the icon from the Polymer icon set.
   */
  @published String icon = '';

  /**
   * If a theme is applied that includes an icon set, the index of the 
   * icon to display.
   */     
  @published int index = -1;
  
  void activeChanged() {
    _logger.finest('polymerCreated');
    
    // TODO(sjmiles): sugar this common case
    this.classes.toggle('selected', this.active);
  }
}
