// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 

library app_element;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('app-element')
class AppElement extends PolymerElement {
  
  @observable
  List icons;
  
  AppElement.created() : super.created();
  
  enteredView(){
    super.enteredView();
    icons = document.createElement('polymer-ui-icon').icons.keys.toList();
  }
}