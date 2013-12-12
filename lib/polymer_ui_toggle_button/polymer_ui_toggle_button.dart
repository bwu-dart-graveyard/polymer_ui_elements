// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_toggle_button;

import 'dart:math';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
//import 'package:polymer_ui_elements/polymer_ui_theme_aware/polymer_ui_theme_aware.dart';

/**
 * polymer-ui-toggle-button is a button that has one of two states (ON/OFF).
 * You can tap or drag the button to switch state.
 *
 * Example:
 *
 *     <polymer-ui-toggle-button></polymer-ui-toggle-button>
 */
@CustomTag('polymer-ui-toggle-button')
class PolymerUiToggleButton extends PolymerElement {
  PolymerUiToggleButton.created() : super.created();

  final _logger = new Logger('PolymerUiToggleButton');
  
  /**
   * Gets or sets the state, true is ON and false is OFF.
   */
  @published bool value = false;
  
  /**
   * If true, don't display caption.
   */
  @published bool noCaption = false;

  /**
   * Caption for on state.
   *
   * @attribute onCaption
   * @type string
   * @default 'ON'
   */
  @published String onCaption = 'ON';
  
  /**
   * Caption for off state.
   *
   * @attribute offCaption
   * @type string
   * @default 'OFF'
   */
  @published String offCaption = 'OFF';
  
  @observable String currentCaption = '';
  int _w;
  int _x;
  
  void ready() {
    super.ready();
    updateCaption();
  }
  
  void toggle() {
    this.value = !this.value;
  }
  
  void noCaptionChanged(oldValue) {
    this.updateCaption();
  }
  
  void onCaptionChanged(oldValue) {
    this.updateCaption();
  }

  void offCaptionChanged(oldValue) {
    this.updateCaption();
  }

  
  void updateCaption() {
    if(noCaption) {
      this.currentCaption = '';
    } else {
      if(value) {
        this.currentCaption = onCaption;
      } else {
        this.currentCaption = offCaption;
      }
    }
  }
  
  void valueChanged(oldValue) {
    updateCaption();
    this.classes.toggle('on', this.value);
    this.$['toggle'].classes.toggle('on', this.value);
  }
  
  void trackStart(e) {
    e.preventTap();
    this._w = this.$['toggle'].offsetWidth - this.clientWidth;
    this.$['toggle'].classes.add('dragging');
  }
  
  void track(e) {
    this._x = max(-this._w, min(0, this.value ? e.dx : e.dx - this._w));
    this.$['toggle'].style.left = '${this._x}px';
  }
  
  void trackEnd(e) {
    this.$['toggle'].style.left = null;
    this.$['toggle'].classes.remove('dragging');
    this.value = (this._x).abs() < this._w / 2;
    //Platform.flush();
  }
  
  void flick(e) {
    this.value = e.xVelocity > 0;
    // Platform.flush();
  }
}