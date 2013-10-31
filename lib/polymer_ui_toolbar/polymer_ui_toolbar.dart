library polymer_ui_toolbar;

//import 'dart:html';
//import 'dart:async';
//import 'package:meta/meta.dart';
import 'package:polymer/polymer.dart';

import 'package:logging/logging.dart';

@CustomTag('polymer-ui-toolbar')
class PolymerCollapseButton extends PolymerElement {
  PolymerCollapseButton.created() : super.created();

  final _logger = new Logger('PolymerUiToolbar');

  /**
   * The selector for the target polymer-collapse element.
   */
  @published String target = '';
  
  bool get applyAuthorStyles => true;
}
