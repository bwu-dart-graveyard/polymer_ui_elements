// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_menu_item;

import 'package:polymer/polymer.dart' show CustomTag, observable, PolymerElement, published;
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_ui_elements/polymer_ui_theme_aware/polymer_ui_theme_aware.dart' show PolymerUiThemeAware;
import 'package:polymer_elements/polymer_selector/polymer_selector.dart' show PolymerSelector;

/**
 * polymer-ui-menu-item is styled to look like a menu item.  It should be used
 * in conjunction with polymer-ui-menu or polymer-ui-sibebar-menu.
 *
 * Example:
 *
 *     <polymer-ui-menu-item icon="settings" label="Settings"></polymer-ui-menu-item>
 */
@CustomTag('polymer-ui-menu-item')
class PolymerUiMenuItem extends PolymerUiThemeAware {
  PolymerUiMenuItem.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-menu-item');
  
  /**
   * The URL of an image for the icon.
   */
  @published String src = '';
  
  /**
   * Specifies the icon from the Polymer icon set.
   */
  @published String icon = '';
  
  /**
   * Specifies the label for the menu item.
   */
  @published String label = '';

  @published String item; // TODO zoechi: item is in JS in attributes list but I couldn't find where it is used and what for 
  
  @observable bool isShowIcon = false;
  
  // calc item's offset middle pos instead of using offsetTop/Height 
  // directly which requires to wait for submenu's collapsing transition to 
  // complete first before it can return the correct pos.
 double getOffsetMiddle() {
    var p = this.parentNode as PolymerSelector;
    if (p != null) {
      var i = p.items;
      var h = this.getItemHeight();
      return i * h + h/2 + p.items[0].offsetTop;
    }
  }
 
  int getItemHeight() {
    return this.offsetHeight;
  }
  
  void updateIsShowIcon() {
    isShowIcon = ((src != null && src.isNotEmpty) || (icon != null && icon.isNotEmpty)); 
  }
  
  void srcChanged(old) {
    updateIsShowIcon();
  }
  
  void iconChanged(old) {
    updateIsShowIcon();
  }
}
