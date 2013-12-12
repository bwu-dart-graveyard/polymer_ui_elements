// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.x_test;

import 'package:polymer/polymer.dart' show CustomTag, observable, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;
import 'ui_filters.dart' show StringToInt;
import 'package:polymer_expressions/filter.dart' show Transformer;

@CustomTag('x-test')
class XTest extends PolymerElement {
  XTest.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('x-test');

  @published List crumbs = [
                            {'label': 'Overview'}, 
                            {'label': 'Subitem1'}, 
                            {'label': 'Subitem2'},
                            {'label': 'Subitem3'}
                            ];
  @published int selected;
  @published var selectedCrumb;
  @observable String selectedLabel;
  // Filters and transformers can be referenced as fields.
  final Transformer asInteger = new StringToInt();
  
  void selectedChanged(old) {
    selectedLabel = crumbs[selected]['label'];
  }
}
