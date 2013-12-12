// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_menu_item;

import 'package:polymer/polymer.dart' show CustomTag, observable, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
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

  
  /**
   * Specifies the URL of the link it goes to when tapped on.
   *
   * Example:
   *
   *     <polymer-ui-menu-item icon="favorite" label="Favorite" href="http://www.polymer-project.org/"></polymer-ui-menu-item>
   *
   * If you want more control on the link, e.g. specify the target for where to
   * open the linked document, you can put <a> directly inside the menu-item.
   *
   * Example:
   *
   *     <polymer-ui-menu-item icon="favorite" label="Favorite">
   *       <a href="http://www.polymer-project.org/" target="_self"></a>
   *     </polymer-ui-menu-item>
   */
  @published String href = '';
  
  @published String item;  
  
  @observable bool isShowIcon = false;
  @observable bool isHideHref = false;
  
  // calc item's offset middle pos instead of using offsetTop/Height 
  // directly which requires to wait for submenu's collapsing transition to 
  // complete first before it can return the correct pos.
 double getOffsetMiddle() {
    var p = this.parentNode as PolymerSelector;
    if (p != null) {
      var i = p.items.indexOf(this);
      var h = this.getItemHeight();
      return i * h + h/2 + p.items[0].offsetTop;
    }
  }
 
  void hrefChanged(old) {
    isHideHref = (href == null && href.isEmpty); 
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
