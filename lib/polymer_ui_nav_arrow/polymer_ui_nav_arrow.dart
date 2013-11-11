// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_nav_arrow;

import 'dart:async' show Timer;
import 'dart:html' show Element;
import 'package:polymer/polymer.dart' show CustomTag, published;
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_ui_elements/polymer_ui_arrow/polymer_ui_arrow.dart' show PolymerUiArrow;

/**
 * polymer-ui-nav-arrow is a polymer-ui-arrow that can be positioned to the 
 * right of the target node.  This element is used in 
 * <a href="polymer-ui-sidebar-menu.html">polymer-ui-sidebar-menu</a>.
 *
 * Example:
 *
 *     <polymer-selector selectedItem="{{item}}">
 *       <div>Item 1</div>
 *       <div>Item 2</div>
 *       <div>Item 3</div>
 *       <div>Item 4</div>
 *       <div>Item 5</div>
 *     </polymer-selector>
 *     <polymer-ui-nav-arrow target="{{item}}"></polymer-ui-nav-arrow>
 */
@CustomTag('polymer-ui-breadcrumbs')
class PolymerUiNavArrow extends PolymerUiArrow {
  PolymerUiNavArrow.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-nav-arrow');
  
  /**
   * The target element.
   */
  @published Element target; 
  
  String _direction = 'left';
  int _size = 9;
  String _borderColor = '#000';
  bool _show = false;
  
  @override
  void enteredView() {
    super.enteredView();
    this.showChanged(null);
  }
  
  void showChanged(oldValue) {
    this.classes.toggle('hidden', !this._show);
  }
  
  void targetChanged() {
    this._show = (this.target != null);
    if (this.target != null) {
      new Timer(new Duration(milliseconds: 0), () => move());
    }
  }
  
  void translateY(y) {
    var s = this.style;
    s.transform = 'translate3d(0,${y}px,0)';
  }
  
  void move() {
    var t = this.target;
    // if the target has getOffsetMiddle(), use that instead
    // TODO var y = t.getOffsetMiddle ? t.getOffsetMiddle() : 
      var y = (t.offsetTop + t.offsetHeight / 2);
    this.translateY(y);
  }
}
