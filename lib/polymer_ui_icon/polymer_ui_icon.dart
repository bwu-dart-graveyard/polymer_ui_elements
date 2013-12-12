// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_icon;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
import 'package:polymer_ui_elements/polymer_ui_theme_aware/polymer_ui_theme_aware.dart';

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
  PolymerUiIcon.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('PolymerUiIcon');
  
  /**
   * The URL of an image for the icon.
   */
  @published String src = '';
  
  /**
   * Specifies the size of the icon.
   */
  @published int size = 24;
  
  /**
   * Specifies the icon from the Polymer icon set.
   */
  @published String icon = '';
  
  int _bx = 0;
  int _by = 0;

  // memoize offset because getComputedStyle is expensive
  var themes = {};

  var icons = new Map<String, int>();
  
  @published int index;
      
  @override 
  void polymerCreated() {
    _logger.finest('polymerCreated');
    
    var _icons = [
                 'drawer',
                 'menu',
                 'search',
                 'dropdown',
                 'close',
                 'add',
                 'trash',
                 'refresh',
                 'settings',
                 'dialoga',
                 'left',
                 'right',
                 'down',
                 'up',
                 'grid',
                 'contact',
                 'account',
                 'plus',
                 'time',
                 'marker',
                 'briefcase',
                 'array',
                 'columns',
                 'list',
                 'modules',
                 'quilt',
                 'stream',
                 'maximize',
                 'shrink',
                 'sort',
                 'shortcut',
                 'dialog',
                 'twitter',
                 'facebook',
                 'favorite',
                 'gplus',
                 'filter',
                 'tag',
                 'plusone',
                 'dots'
                 ];
    int i = 0;
    _icons.forEach((name) {
      icons[name] = i++;
    });
    
    super.polymerCreated();
  }
  
  @override
  void ready() {
    super.ready();
    this.sizeChanged();
  }
    
  void sizeChanged() {
    _logger.finest('sizeChanged');
    
    this.style.width =  '${this.size}px';
    this.style.height = '${this.size}px';
  }
  
  void iconChanged(old) {
    _logger.finest('iconChanged');
    
    if(icons.containsKey(this.icon)) {
      this.index = icons[this.icon];
    } else {
      this.index = -1;
    }
  }
  
  void indexChanged(old) {
    _logger.finest('indexChanged');
    
    this.classes.add('polymer-ui-icons');
    this._by = -this.size * this.index;
    this.updateIcon();
  }
  
  void srcChanged() {
    _logger.finest('srcChanged');
    
    this.classes.remove('polymer-ui-icons');
    this.style.backgroundImage = 'url(' + this.src + ')';
    this.updateIcon();
  }
  
  void activeThemeChanged(old) {
    _logger.finest('activeThemeChanged');
    
    super.activeThemeChanged(old);
    this.style.backgroundPosition = '';
    this._bx = calcThemeOffset(this.activeTheme, this);
    this.updateIcon();
  }
  
  
  void updateIcon() {
    _logger.finest('updateIcon');
    
    if (this.src != null && this.src.isNotEmpty) {
      this.style.backgroundPosition = 'center';
      this.style.backgroundSize = '${this.size}px ${this.size}px';
    } else {
      this.style.backgroundPosition = '${this._bx}px ${this._by}px';
    }
  }

  int calcThemeOffset(String theme, Element node) {
    _logger.finest('calcThemeOffset');
    
    if (themes[theme] == null) {
      var bp = node.getComputedStyle().backgroundPosition.split(' ');
      // support 4 value syntax (https://code.google.com/p/chromium/issues/detail?id=310977)
      // bg.removeAt(0);
      var l = bp.length == 4 ? bp[1] : bp[0];
      
      var offset = num.parse(new RegExp(r'^[-+\d,\.]*').firstMatch(l).group(0));
      
      _logger.finest('calcThemeOffset - theme: ${theme}; offset: ${offset}');
      themes[theme] = offset;
    }
    return themes[theme]; 
  }  
}
