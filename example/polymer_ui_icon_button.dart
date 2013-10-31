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