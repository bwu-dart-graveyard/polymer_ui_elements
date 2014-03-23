// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.

/**
 * polymer-ui-clock is a polymer clock element.
 *
 * Example:
 *
 *     <polymer-ui-clock></polymer-ui-clock>
 *
 * @class polymer-ui-clock
 */

library polymer_ui_elements.polymer_ui_clock;

import 'dart:core';
import 'dart:async';
import 'dart:math';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-ui-clock')
class PolymerUiClock extends PolymerElement {

  // note: properties only used in MDV bindings need not be declared (xSecond, ySecond, rotateSecond, etc.)
  // properties that need observation (e.g. we observe 'time' via 'timeChanged') must be declared

  var _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  var _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep',
      'Oct', 'Nov', 'Dec'];
  var _degToRad = PI / 180;

  /**
   * The date time value.
   */
  @published
  DateTime time = new DateTime.now();

  /**
   * The date string value.
   */
  @observable
  String dateStr = '';

  @observable
  int seconds;

  @observable
  int minutes;

  @observable
  int hours;
  @observable
  var xSecond;
  @observable
  var ySecond;
  @observable
  var xMinute;
  @observable
  var yMinute;
  @observable
  var xHour;
  @observable
  var yHour;
  @observable
  var rotateSecond;
  @observable
  var rotateMinute;
  @observable
  var rotateHour;

  Timer _timer;

  PolymerUiClock.created(): super.created();

  @override
  void enteredView() {
    super.enteredView();
    var oneSecond = new Duration(seconds: 1);
    _timer = new Timer.periodic(oneSecond, updateTime);
    updateTime(_timer);
  }

  @override
  void leftView() {
    _timer.cancel();
    super.leftView();
  }

  void updateTime(Timer t) {
    time = new DateTime.now();
  }

  void timeChanged() {
    dateStr = [_days[time.weekday - 1], _months[time.month], time.day].join(' ');
    hours = time.hour;
    minutes = time.minute;
    seconds = time.second;
  }

  void secondsChanged() {
    // if secods have changed, update the clock second hand
    rotateSecond = this.seconds * 6;
    var px = 1;
    var py = 50;
    px = px - 49 * sin(rotateSecond * _degToRad);
    py = py + 49 * cos(rotateSecond * _degToRad);
    xSecond = 99 - px;
    ySecond = 99 - py;
  }

  void minutesChanged() {
    // if minutes have changed, update the clock minute hand
    rotateMinute = this.minutes * 6;
    var px = 2;
    var py = 46;
    px = px - 44 * sin(rotateMinute * _degToRad);
    py = py + 44 * cos(rotateMinute * _degToRad);
    xMinute = 99 - px;
    yMinute = 99 - py;
  }

  void hoursChanged() {
    // if hours have change, update the clock hour hand
    rotateHour = this.hours * 30;
    var px = 3;
    var py = 41;
    px = px - 38 * sin(rotateHour * _degToRad);
    py = py + 38 * cos(rotateHour * _degToRad);
    xHour = 99 - px;
    yHour = 99 - py;
  }
}
