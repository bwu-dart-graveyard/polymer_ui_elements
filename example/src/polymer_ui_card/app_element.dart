// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_card.example;

import 'dart:html' show Event, document, HtmlElement;
import 'package:polymer/polymer.dart' show CustomTag, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_ui_elements/polymer_ui_card/polymer_ui_card.dart' 
  show PolymerUiCard;

@CustomTag('app-element')
class AppElement extends PolymerElement {
  AppElement.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('app-element');

  @override
  void enteredView() {
    super.enteredView();
    (document.querySelector('#cards') as PolymerUiCard).onCardSwypeAway.listen(
        (Event e) => (e.target as HtmlElement).remove()); 
  }
}