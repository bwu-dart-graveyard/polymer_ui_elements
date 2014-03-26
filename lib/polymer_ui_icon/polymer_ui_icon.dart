// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.
library polymer_ui_elements.polymer_ui_icon;

import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
import 'package:polymer_ui_elements/polymer_ui_theme_aware/polymer_ui_theme_aware.dart';
import 'package:polymer_ui_elements/polymer_ui_iconset/polymer_ui_iconset.dart' show PolymerUiIconset;

/**
 * polymer-ui-icon is a 24x24 glyph expressed as a background-image.
 *
 * Example:
 *
 *     <polymer-ui-icon src="star.png"></polymer-ui-icon>
 *
 * Optionally can use other size like 32x32 by setting the attribute "size" to "32":
 *
 *     <polymer-ui-icon src="big_star.png" size="32"></polymer-ui-icon>
 *
 * Polymer includes an icon set.  The property "icon" can be used
 * to specify which icon to use.
 *
 * Example:
 *
 *     <polymer-ui-icon icon="menu"></polymer-ui-icon>
 *
 * @class polymer-ui-icon
 */
@CustomTag('polymer-ui-icon')
class PolymerUiIcon extends PolymerUiThemeAware {
  PolymerUiIcon.created(): super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('PolymerUiIcon');

  /**
   * The URL of an image for the icon.
   */
  @published
  String src = '';

  /**
   * Specifies the size of the icon.
   */
  @published
  int size = 24;

  /**
   * Specifies the icon from the Polymer icon set.
   */
  @published
  String icon = '';

  String defaultIconset = 'polymer-ui-icons';

  int _bx = 0;
  int _by = 0;

  // memoize offset because getComputedStyle is expensive
  var themes = {};

  var icons = new Map<String, int>();

  @published
  int index;

  @override
  void ready() {
    super.ready();
    this.sizeChanged();
  }

  void sizeChanged() {
    _logger.finest('sizeChanged');

    this.style.width = '${this.size}px';
    this.style.height = '${this.size}px';
  }

  void srcChanged() {
    _logger.finest('srcChanged');

    this.style.backgroundImage = 'url(${this.src})';
    this.style.backgroundPosition = 'center';
    this.style.backgroundSize = '${this.size}px ${this.size}px';
  }

  void iconChanged(old) {
    _logger.finest('iconChanged');

    updateIcon();
  }

  @override
  void activeThemeChanged(old) {
    super.activeThemeChanged(old);
    this.updateIcon();
  }

  void indexChanged(old) {
    _logger.finest('indexChanged');

    this.classes.add('polymer-ui-icons');
    this._by = -this.size * this.index;
    this.updateIcon();
  }

  PolymerUiIconset getIconset([String name]) {
    var n = name;
    if (name == null || name.isEmpty) n = this.defaultIconset;
    return ($['meta'] as PolymerUiIconset).byId(n);
    //return $['meta'].querySelector('#$n');
  }

  void updateIcon() {
    _logger.finest('updateIcon');

    if (this.icon == null || this.icon.isEmpty) return;

    var a = this.icon.split(':');
    var icon = a.removeAt(a.length - 1);

    String n;

    if (a.length > 0) {
      n = a.removeAt(a.length - 1);
    }

    var  s = getIconset(n);

    if (s != null) {
      var o = s.getOffset(icon, this.activeTheme);
      if (o != null) {
        var r = this.size / s.iconsize;
        this.style.backgroundImage = 'url(${s.src})';
        this.style.backgroundPosition =
            '${-o['offsetx'] * r}px ${-o['offsety'] * r}px';
        this.style.backgroundSize = r == 1 ? 'auto' : '${s.width * r}px';
      }
    }
  }
}
