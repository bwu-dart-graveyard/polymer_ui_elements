// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.
library polymer_ui_elements.polymer_ui_submenu_item;

import 'dart:async' show Stream;
import 'dart:html' show CustomEvent, Element, EventStreamProvider;
import 'package:polymer/polymer.dart' show CustomTag, observable,
    PolymerElement, published, ChangeNotifier, reflectable;
    // TODO remove ChangeNotifier, reflectable when bug is solved
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_ui_elements/polymer_ui_menu_item/polymer_ui_menu_item.dart'
    show PolymerUiMenuItem;
import 'package:polymer_ui_elements/polymer_ui_menu/polymer_ui_menu.dart' show
    PolymerUiMenu;
import 'package:polymer_elements/src/interfaces.dart' show HasItems;

/**
 * polymer-ui-submenu-item is a menu-item that can contains other menu-items.
 * It should be used in conjunction with polymer-ui-menu or
 * polymer-ui-sibebar-menu.
 *
 * Example:
 *
 *     <polymer-ui-menu selected="0">
 *       <polymer-ui-submenu-item icon="settings" label="Topics">
 *         <polymer-ui-menu-item label="Topics 1"></polymer-ui-menu-item>
 *         <polymer-ui-menu-item label="Topics 2"></polymer-ui-menu-item>
 *       </polymer-ui-submenu-item>
 *       <polymer-ui-submenu-item icon="settings" label="Favorites">
 *         <polymer-ui-menu-item label="Favorites 1"></polymer-ui-menu-item>
 *         <polymer-ui-menu-item label="Favorites 2"></polymer-ui-menu-item>
 *         <polymer-ui-menu-item label="Favorites 3"></polymer-ui-menu-item>
 *       </polymer-ui-submenu-item>
 *     </polymer-ui-menu>
 */
@CustomTag('polymer-ui-submenu-item')
class PolymerUiSubmenuItem extends PolymerUiMenuItem implements HasItems {
  PolymerUiSubmenuItem.created(): super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('PolymerUiSubmenuItem');

  @published
  var selected;
  @published
  Element selectedItem;

  @published
  bool active = false;

  @observable
  bool collapsed = true;

  static const EventStreamProvider<CustomEvent> _polymerSelectEvent =
      const EventStreamProvider<CustomEvent>('polymer-select');

  Stream<CustomEvent> get onPolymerSelect =>
      PolymerUiSubmenuItem._polymerSelectEvent.forTarget(this);

  List<Element> get items {
    return (this.$['menu'] as PolymerUiMenu).items;
  }

  bool hasItems() {
    return this.items.length > 0;
  }

  void unselectAllItems() {
    var menu = (this.$['menu'] as PolymerUiMenu);
    menu.selected = null;
    menu.clearSelection();
  }

  void activeChanged() {
    if (this.hasItems()) {
      this.collapsed = !this.active;
    }
    if (!this.active) {
      this.unselectAllItems();
    }
    this.$['item'].classes.toggle('no-active-bg', this.hasItems());
  }

  void activate() {
    if (this.hasItems() && this.active) {
      this.collapsed = !this.collapsed;
      this.unselectAllItems();
      this.fire('polymer-select', detail: {
        'isSelected': true,
        'item': this
      });
    }
  }

  int getItemHeight() {
    var item = this.$['item'];
    if (item != null) {
      return item.offsetHeight;
    }
    return 0;
  }
}
