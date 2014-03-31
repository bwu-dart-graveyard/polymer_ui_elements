// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.
library polymer_ui_elements.polymer_ui_menu;

import 'dart:html';
import 'package:polymer/polymer.dart' show CustomTag, observable, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_elements/polymer_selector/polymer_selector.dart' show PolymerSelector;
import 'package:polymer_ui_elements/polymer_ui_theme_aware/polymer_ui.dart' as ui;

/**
 * polymer-ui-menu is a polymer-selector with theme propagation.  It styles to look like
 * a menu and should be used in conjunction with polymer-ui-menu-item.
 *
 * Example:
 *
 *     <polymer-ui-menu selected="0">
 *       <polymer-ui-menu-item icon="settings" label="Settings"></polymer-ui-menu-item>
 *       <polymer-ui-menu-item icon="dialog" label="Dialog"></polymer-ui-menu-item>
 *       <polymer-ui-menu-item icon="search" label="Search"></polymer-ui-menu-item>
 *     </polymer-ui-menu>
 *
 * The "selectedItem" property returns the currently selected item.
 *
 * Example:
 *
 *     <polymer-ui-menu selected="0" selectedItem="{{item}}">
 *       <polymer-ui-menu-item icon="settings" label="Settings"></polymer-ui-menu-item>
 *       <polymer-ui-menu-item icon="dialog" label="Dialog"></polymer-ui-menu-item>
 *       <polymer-ui-menu-item icon="search" label="Search"></polymer-ui-menu-item>
 *     </polymer-ui-menu>
 *
 *     <div>selected label: {{item.label}}</div>
 *
 * The event "polymer-select" can also be used to listen for selection change.
 *
 * Example:
 *
 *     <polymer-ui-menu selected="0" on-polymer-select="{{selectAction}}">
 *       <polymer-ui-menu-item icon="settings" label="Settings"></polymer-ui-menu-item>
 *       <polymer-ui-menu-item icon="dialog" label="Dialog"></polymer-ui-menu-item>
 *       <polymer-ui-menu-item icon="search" label="Search"></polymer-ui-menu-item>
 *     </polymer-ui-menu>
 *
 *     ...
 *
 *     selectAction: function(e, detail) {
 *       if (detail.isSelected) {
 *         var selectedItem = detail.item;
 *         ...
 *       }
 *     }
 */
@CustomTag('polymer-ui-menu')
class PolymerUiMenu extends PolymerSelector {
  PolymerUiMenu.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-menu');

  @published String theme = '';

  @observable String activeTheme = '';

  List<Element> get items {
    return super.items;
  }
  void enteredView() {
    super.enteredView();
    this.activeTheme = ui.validateTheme(this, theme: this.theme, activeTheme: this.activeTheme, defaultTheme: '');
  }

  void themeChanged() {
    this.activeTheme = this.theme;
  }

  void activeThemeChanged(String old) {
    this.classes.remove(old);
    this.classes.add(this.activeTheme);
  }

  void selectionChange(e, Map<String, dynamic> detail) {
    if (detail['isSelected'] as bool) {
      var i = detail['item'];
      // find nested selected item
      while ((i is PolymerSelector) && (i as PolymerSelector).selectedItem != null) {
        i = (i as PolymerSelector).selectedItem;
      }
      this.selectedItem = i;
    }
  }
}
