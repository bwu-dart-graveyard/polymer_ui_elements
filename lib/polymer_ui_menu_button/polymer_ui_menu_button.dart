// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_menu_button;

import 'dart:async' show StreamSubscription, Timer;
import 'dart:html' show DeviceOrientationEvent, Element, window;
import 'package:polymer/polymer.dart' show CustomTag, observable, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;

//import 'package:polymer_ui_elements/polymer_ui_menu/polymer_ui_menu.dart' show PolymerUiMenu;
//import 'package:polymer_elements/polymer_anchor_point/polymer_anchor_point.dart' show PolymerAnchorPoint;

/**
 * polymer-ui-menu-button is a polymer-ui-icon-button with a drop down menu
 * that allows the user to select an option. The drop down menu is styled with
 * an arrow pointing to the button, and can be positioned to the top or the
 * bottom of the button with the valign property. The valign property aligns
 * the menu to the left or right edge of the button.
 *
 * Example:
 *
 *     <polymer-ui-menu-button selected="0">
 *       <polymer-ui-menu-item icon="settings" label="Settings"></polymer-ui-menu-item>
 *       <polymer-ui-menu-item icon="dialog" label="Dialog"></polymer-ui-menu-item>
 *       <polymer-ui-menu-item icon="search" label="Search"></polymer-ui-menu-item>
 *     </polymer-ui-menu-button>
 */
@CustomTag('polymer-ui-menu-button')
class PolymerUiMenuButton extends PolymerElement {
  PolymerUiMenuButton.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-menu-button');
  
  /**
   * The icon to display.
   */
  @published String icon = 'dots';
  
  @published String src = '';
  
  /**
   * The index of the selected menu item.
   */
  @published int selected = 0;
  
  @published Element selectedItem; 
  
  @published String selectedClass;
  
  /**
   * Set to true to open the menu.
   */
  @published bool opened = false;
  
  /**
   * Horizontally align the overlay with the button. Accepted values are
   * ["left", "center", "right"].
   */
  @published String halign = 'center';

  /**
   * Display the overlay on top or below the button. Accepted values are
   * ["top", "bottom"].
   */
  @published String valign = 'bottom';
  @published bool multi = false;
  @published bool parallax = false;
  @published bool responsive = false;
  @published String valueattr;
  
  @observable String mediaQuery = 'max-width: 800px';
  @observable String direction = 'up';
  
  
  bool _isParallaxActionRunning = false;
  
//  @override
//  void ready() {
//    super.ready();
//    this.boundParallaxAction = this.parallaxAction.bind(this);
//  }
  
  StreamSubscription _deviceorientationSubscription;
  Map<String, int> _tilt;
  
  void openedChanged(oldValue) {
    new Timer(Duration.ZERO, () {
      this._isParallaxActionRunning = true;
      // TODO (this.$['arrowPositionHelper'] as PolymerAnchorPoint).apply();
      this.$['arrowPositionHelper'].apply();
      this._tilt = null;
      if (this.parallax) {
        window.onDeviceOrientation.listen((e) => parallaxAction(e));
      } else {
        if(_deviceorientationSubscription != null) {
          _deviceorientationSubscription.cancel();
        }
      }
      this._isParallaxActionRunning = false;
    });
  }
  
  void valignChanged(oldValue) {
    if(valign == 'top') {
      direction = 'down';
    } else {
      direction = 'up';
    }
  }
  
  void parallaxAction(DeviceOrientationEvent e) {
    var tiltLR = 0;
    if (e.gamma != null)  {
      tiltLR = e.gamma.round();
    } 
    var tiltTB = 0;
    if (e.beta != null) {
      tiltTB = e.beta.round();
    }
    if (this._tilt == null) {
      this._tilt = {
                   'lr': tiltLR,
                   'tb': tiltTB
      };
    } else {
      var transX = ((tiltLR - this._tilt['lr']) % 90) / 90 * 8;
      var transY = ((tiltTB - this._tilt['tb']) % 90) / 90 * 13;
      this.$['overlayMenu'].style.transform = 'translate3d(${transX}px,${transY}px,0)';
      this.$['arrow'].style.transform = 'translate3d(${transX}px,${transY}px,0)';
    }
  }
  
  void mediaChangeAction(e) {
    if (e.detail.matches) {
      this.classes.add('fullwidth');
    } else {
      this.classes.remove('fullwidth');
    }
  }
  
  void closeAction() {
    this.opened = false;
  }
  
  /**
   * Toggle the opened state of the dropdown.
   */
  void toggle() {
    this.opened = !this.opened;
  }
  
  /**
   * The selected menu item.
   */
  Element get selection {
    // TODO return (this.$['menu'] as PolymerUiMenu).selection;
    return this.$['menu'].selection;
  }  
}
