// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_field;

import 'dart:html' show Event, Node;
import 'package:polymer/polymer.dart';

@CustomTag('polymer-ui-field')
class PolymerUiField extends PolymerElement {
  PolymerUiField.created() : super.created();

  // child notifies with this event, that we should modify class
  void onPolymerClassChange(Event e, var details, Node node) {
    if(details is Map) {
      details.forEach((String k, String v) {
        switch(k) {
          case 'add':
            this.classes.add(v);
            break;
            
          case 'remove':
            this.classes.remove(v);
            break;
            
          case 'toggle':
            this.classes.toggle(v);
            break;
        }
      });
    }
  
    e.stopImmediatePropagation();
  }

}