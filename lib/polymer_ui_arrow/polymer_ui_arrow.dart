// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 

/**
 * polymer-ui-arrow is styled to look like an arrow.
 *
 * Example:
 *
 *     <polymer-ui-arrow direction="up" size="20"></polymer-ui-arrow>
 *
 * @class polymer-ui-arrow
 */

library polymer_ui_elements.polymer_ui_arrow;

import 'dart:async';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-ui-arrow')
class PolymerUiArrow extends PolymerElement {
  
  var _borders = {
    'up': 'Bottom',
    'down': 'Top',
    'left': 'Right',
    'right': 'Left'
  };
  
  var _tops = {
    'up': 1,
    'down': -1,
    'left': 0,
    'right': 0
  };
  
  var _lefts = {
    'up': 0,
    'down': 0,
    'left': 1,
    'right': -1
  };
  
  /**
   * Direction of the arrow.  Possible values are 'up', 'down', 'left' 
   * and 'right'.
   */
  @published
  String direction = 'up';
  
  /**
   * Size of the arrow.
   */
  @published
  num size = 10;
  
  /**
   * Color of the arrow.
   */
  @published
  String color = '#fff';
  
  /**
   * Border color.
   */
  
  @published
  String borderColor= '#ccc';
  
  /**
   * Arrow border width.
   */
  @published
  num borderWidth = 1;
  
  var _updateJob;
  
  PolymerUiArrow.created() : super.created();
  
  ready() {
    this.asyncUpdate();
  }
  
  directionChanged() {
    this.asyncUpdate();
  }
  
  sizeChanged() {
    this.asyncUpdate();
  }
  
  colorChanged() {
    this.asyncUpdate();
  }
  
  borderColorChanged() {
    this.asyncUpdate();
  }
  
  borderWidthChanged() {
    this.asyncUpdate();
  }
  
  asyncUpdate() {
    if(_updateJob == null){
      _updateJob = Timer.run(_update);
    }
  }
  
  _update() {
    _updateJob = null;
    var os = this.$['outer'].style;
    var _is = this.$['inner'].style;
    os.borderWidth = '${this.size}px';
    _is.borderWidth = '${this.size}px';
    os.borderColor = 'transparent';
    _is.borderColor = 'transparent';
    var bc = 'border-' + this._borders[this.direction] + '-Color';
    os.setProperty(bc, this.borderColor);
    _is.setProperty(bc, this.color);
    _is.top = '${(this._tops[this.direction] * this.borderWidth).toString()}px';
    _is.left = '${(this._lefts[this.direction] * this.borderWidth).toString()}px';
  }
}
