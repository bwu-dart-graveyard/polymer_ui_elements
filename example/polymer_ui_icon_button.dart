// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library main;

//import 'dart:async';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';

//import 'package:polymer_ui_elements/polymer_ui_icon_button/polymer_ui_icon_button.dart';

//@initMethod
main() {
  hierarchicalLoggingEnabled = true;
  Logger.root.level = Level.FINEST;

  //Logger.root.onRecord.listen((e) => print(e));
  
  //Polymer.register('polymer-ui-icon-button', PolymerUiIconButton);
  initPolymer();
}