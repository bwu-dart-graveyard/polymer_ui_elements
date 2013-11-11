// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_pages;

import 'package:polymer/polymer.dart' show CustomTag, PolymerElement, published;
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_elements/polymer_selector/polymer_selector.dart' show PolymerSelector;

@CustomTag('polymer-ui-pages')
class PolymerUiPages extends PolymerSelector {
  PolymerUiPages.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-pages');
}
