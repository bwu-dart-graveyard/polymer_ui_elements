// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_accordion;

//import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/polymer_selector/polymer_selector.dart';

/**
 * polymer-ui-accordion is a simple accordion style element.  It should 
 * be used in conjunction with polymer-ui-collapsible.  By default
 * only one collapsible stays open at a time.  To have multiple
 * collapsibles open set "multi" property on the accordion.
 *
 * Example:
 *
 *     <polymer-ui-accordion selected="0">
 *       <polymer-ui-collapsible>
 *         <div class="polymer-ui-collapsible-header">Header 1</div>
 *         <div>....</div>
 *       </polymer-ui-collapsible>
 *       <polymer-ui-collapsible>
 *         <div class="polymer-ui-collapsible-header">Header 2</div>
 *         <div>....</div>
 *       </polymer-ui-collapsible>
 *       <polymer-ui-collapsible>
 *         <div class="polymer-ui-collapsible-header">Header 3</div>
 *         <div>....</div>
 *       </polymer-ui-collapsible>
 *     </polymer-ui-accordion>
 */
@CustomTag('polymer-ui-accordion')
class PolymerUiAccordion extends PolymerSelector {
  PolymerUiAccordion.created() : super.created();

  
  void activateHandler(e) {
    //TODO Uncomment when notap is supported
    /*
    if (!e.notap) {
      super.activateHandler(e);
    }
    */
    super.activateHandler(e);
  }
  
}