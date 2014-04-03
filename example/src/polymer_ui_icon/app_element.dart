// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.

library app_element;

import 'package:polymer/polymer.dart';
import 'package:polymer_ui_elements/polymer_ui_icon/polymer_ui_icon.dart' show
    PolymerUiIcon;

@CustomTag('app-element')
class AppElement extends PolymerElement {

  @observable
  List icons;

  AppElement.created(): super.created();

  void enteredView() {
    super.enteredView();
    icons = ($['meta'] as PolymerUiIcon).getIconset().iconMap.keys.toList();
  }

  // TODO remove workaround when https://code.google.com/p/dart/issues/detail?id=17981 is fixed
  set icon(var x) {
   // print(x);
  }
}
