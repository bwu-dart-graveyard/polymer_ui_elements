// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_sidebar_header;

import 'package:polymer/polymer.dart' show CustomTag, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;

@CustomTag('polymer-ui-sidebar-header')
class PolymerUiSidebarHeader extends PolymerElement {
  PolymerUiSidebarHeader.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-sidebar-header');
  
  @published String label = '';
}
