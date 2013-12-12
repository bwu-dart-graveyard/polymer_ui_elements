// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_ratings;

import 'dart:html' show Element, Event;
import 'package:observe/observe.dart' show ObservableList, ObservableMap;
import 'package:polymer/polymer.dart' show CustomTag, observable, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)

import 'package:logging/logging.dart' show Logger;
import 'package:polymer_ui_elements/polymer_ui_theme_aware/polymer_ui_theme_aware.dart' 
  show PolymerUiThemeAware;

/**
 * polymer-ui-ratings allows users to rate items.
 *
 * Example:
 *
 *     <polymer-ui-ratings value="3"></polymer-ui-ratings>
 *
 * By default polymer-ui-ratings shows 5 stars but can be configured using 
 * "count" attribute:
 *
 *     <polymer-ui-ratings value="3" count="10"></polymer-ui-ratings>
 *
 * @class polymer-ui-ratings
 */
@CustomTag('polymer-ui-ratings')
class PolymerUiRatings extends PolymerUiThemeAware {
  PolymerUiRatings.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-ratings');

  /**
   * Number of stars to display.
   */
  @published int count = 5;

  /**
   * Number of selected stars.
  *
   * @attribute value
   * @type number
   * @default 0
   */
  @published int value = 0;
  @observable ObservableList<ObservableMap> stars;
  
  @override
  void ready() {
    super.ready();
    this.countChanged(null);
  }
  
  void countChanged(oldValue) {
    this.stars = new ObservableList<ObservableMap>();
    for (var i = 0; i < this.count; i++) {
      this.stars.add(new ObservableMap.from({'index': i}));
    }
    this.valueChanged(null);
  }
  
  void valueChanged(oldValue) {
    if(this.stars != null) {
      int i = 0;
      for(Map s in this.stars) {
        s['starClass'] = i < this.value ? 'full' : '';
        i++;
      }
    }
  }
  
  /**
   * [updateValue] is the tap event handler.
   */
  void updateValue(Event event, detail, Element sender) {
    int i = int.parse(sender.attributes['index']);
    this.value = i + 1;
  }
}
