// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_splitter;

import 'dart:html' show Element;
import 'package:polymer/polymer.dart' show CustomTag, PolymerElement, published;
import 'package:logging/logging.dart' show Logger;

/**
 * polymer-ui-splitter provides a spilt bar and dragging on the split bar
 * will resize the sibling element.  Use the property "direction" to indicate
 * which sibling to be resized and the orientation.
 *
 * Example:
 *
 *     <div class="flexbox">
 *       <div>left</div>
 *       <polymer-ui-splitter direction="left"></polymer-ui-splitter>
 *       <div flex>right</div>
 *     </div>
 *
 * For horizontal splitter set direction to "up" or "down".
 *
 * Example:
 *
 *     <div class="flexbox column">
 *       <div>top</div>
 *       <polymer-ui-splitter direction="up"></polymer-ui-splitter>
 *       <div flex>bottom</div>
 *     </div>
 */
@CustomTag('polymer-ui-splitter')
class PolymerUiSplitter extends PolymerElement {
  PolymerUiSplitter.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-splitter');
  
  /**
   * Possible values are "left", "right", "up" and "down".
   */
  @published String direction = 'left';

  /**
   * Locks the split bar so it can't be dragged.
   */
  @published bool locked = false;

  bool _isNext;
  bool _horizontal;
  Element _target;
  String _dimension;
  int _size;
  
  @override
  void ready() {
    super.ready();
    this.directionChanged(null);
  }
  
  void directionChanged(oldValue) {
    this._isNext = this.direction == 'right' || this.direction == 'down';
    this._horizontal = this.direction == 'up' || this.direction == 'down';
    this.update();
  }
  
  void update() {
    this._target = this._isNext ? this.nextElementSibling : this.previousElementSibling;
    this._dimension = this._horizontal ? 'height' : 'width';
    this.classes.toggle('horizontal', this._horizontal);
  }
  
  void trackStart(e) {
    this.update();
    this.classes.add('active');
    this._size = int.parse(this._target.getComputedStyle().getPropertyValue(this._dimension));
  }
  
  void track(e) {
    if (this.locked) {
      return;
    }
    var d = e[this._horizontal ? 'dy' : 'dx'];
    this._target.style.setProperty(this._dimension, 
        '${this._size + (this._isNext ? -d : d)}px');
  }
  
  void trackEnd() {
    this.classes.remove('active');
  }
}
