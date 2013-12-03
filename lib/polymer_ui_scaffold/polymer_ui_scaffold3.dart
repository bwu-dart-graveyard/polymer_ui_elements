// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_scaffold3;

import 'package:polymer/polymer.dart' show CustomTag, PolymerElement, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_elements/polymer_grid_layout/polymer_grid_layout.dart' show PolymerGridLayout;

@CustomTag('polymer-ui-scaffold3')
class PolymerUiScaffold3 extends PolymerElement {
  PolymerUiScaffold3.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('polymer-ui-scaffold3');
  
  @published bool menuActive = false;
  @published bool hideMenuButton = false;
  Map<String,List<List<int>>> layouts = {
    'main':[
          [3, 3],
          [4, 4],
          [4, 4]
    ],
    'menu': [
      [1, 2],
      [1, 2],
      [1, 2]
    ]};

  @override
  void ready() {
    super.ready();
    (this.$['grid'] as PolymerGridLayout).layout = this.layouts['main'];
  }
  
  void menuActionTap() {
    this.menuActive = !this.menuActive;
  }
  
  void menuActiveChanged() {
    (this.$['grid'] as PolymerGridLayout).layout = this.layouts[this.menuActive ? 'menu' : 'main'];
  }
}
