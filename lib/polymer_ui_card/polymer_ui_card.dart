// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_card;

import 'dart:async' show Stream, StreamSubscription;
import 'dart:html' show CssStyleDeclaration, CustomEvent, EventStreamProvider ,HtmlElement;
import 'dart:math' show max, sqrt;
import 'package:polymer/polymer.dart' show CustomTag, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;

/**
 * polymer-ui-card <b>(WIP)</b>
 *
 * Example:
 *
 *     <polymer-ui-card>
 *       ...
 *     </polymer-ui-card>
 *
 * @class polymer-ui-card
 */
@CustomTag('polymer-ui-card')
class PolymerUiCard extends PolymerElement {
  PolymerUiCard.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-card');
  
  /**
   * If true, the card can be swiped.
   */
  @published bool swipeable = false;
  @published bool noCurve = false;
  double _offsetRatio = 0.2;
  double _widthRatio = 3.0;
  double _w;
  double _offsetWidth;
  bool _away;
  
  StreamSubscription _transitionEndSubscription;

  static const EventStreamProvider<CustomEvent> _cardSwypeAwayEvent =
      const EventStreamProvider<CustomEvent>('polymer-card-swipe-away');

  /**
   * Fired when the card is swiped away.
   */
  Stream<CustomEvent> get onCardSwypeAway =>
      PolymerUiCard._cardSwypeAwayEvent.forTarget(this);

  @override
  void ready() {
    super.ready();
    this.setAttribute('touch-action', 'pan-y');
  }
  
  @override
  void leftView() {
    this.removeListeners();
    super.leftView();
  }
  
  void addListeners() {
    this.onTransitionEnd.listen((e) => this.transitionEnd(e));
  }
  
  void removeListeners() {
    if (_transitionEndSubscription != null) {
      _transitionEndSubscription.cancel();
    }
  }
  
  void swipeableChanged(oldValue) {
    if (this.swipeable) {
      this.addListeners();
    } else {
      this.removeListeners();
    }
  }
  
  void animate(double x) {
    CssStyleDeclaration s = this.style;
    var d = x > 0 ? 1 : -1;
    var w = this._w * this._widthRatio;
    var x1 = max(0, x.abs() - this._w * this._offsetRatio);
    var r = max(0, (w - x1) / w);
    var y = w - sqrt(w * w - x1 * x1);
    var deg = (1 - r) * d * 90;
    s.opacity = r;
    var translate = 'translate3d(${x}px,${(this.noCurve ? 0 : y)}px,0)';
    var rotate = 'rotate(${deg}deg)';
    s.transform = translate + (this.noCurve ? '' : ' ' + rotate);
  }
  
  void trackStart(e) {
    if (this.swipeable) {
      e.preventTap();
      this._w = this._offsetWidth;
      this.classes.add('dragging');
    }
  }
  
  void track(e) {
    if (this.swipeable) {
      this.animate(e.dx);
    }
  }
  
  void trackEnd(e) {
    if (this.swipeable) {
      this.swipeEnd((e.dx).abs() > this._w / 2 && e.dx * e.xDirection > 0, 
          e.dx > 0);
    }
  }
  
  void flick(e) {
    if (this.swipeable && !this._away) {
      var v = e.xVelocity;
      this.swipeEnd(v.abs() > 2, v > 0);
    }
  }
  
  void swipeEnd(bool away, bool dir) {
    this.classes.remove('dragging');
    this._away = away;
    if (away) {
      var w = this._w * this._widthRatio;
      this.animate(dir ? w : -w);
    } else {
      this.animate(0.0);
    }
  }
  
  void transitionEnd(e) {
    if (this._away) {
      dispatchEvent(new CustomEvent('polymer-card-swipe-away'));
    }
  }
}