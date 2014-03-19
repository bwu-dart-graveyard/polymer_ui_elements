// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.
library polymer_ui_elements.polymer_ui_nav_arrow.app_element;

//import 'dart:async' show Timer;
import 'dart:html' show CustomEvent, Element, Event;
import 'package:polymer/polymer.dart' show CustomTag, PolymerElement;
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_ui_elements/polymer_ui_nav_arrow/polymer_ui_nav_arrow.dart' show PolymerUiNavArrow;
//import 'package:polymer_elements/polymer_selector/polymer_selector.dart' show PolymerSelector;

@CustomTag('app-element')
class AppElement extends PolymerElement {
  AppElement.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('app-element');

  void selectHandler(Event e, details, Element target) {
    if (details['isSelected']) {
      ($['nav-arrow'] as PolymerUiNavArrow).target = details['item'];
    }
  }
}
