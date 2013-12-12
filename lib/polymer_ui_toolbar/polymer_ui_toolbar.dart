// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_toolbar;

import 'dart:html' show Event, Node, CustomEvent;
import 'package:polymer/polymer.dart' show CustomTag, observable, published,
ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved  
// https://code.google.com/p/dart/issues/detail?id=13849
// (https://code.google.com/p/dart/issues/detail?id=15095)
import 'package:logging/logging.dart' show Logger;
import 'package:polymer_ui_elements/polymer_ui_theme_aware/polymer_ui_theme_aware.dart';

/**
 * polymer-ui-toolbar is a horizontal bar containing elements that can perform actions.
 *
 * Example:
 *
 *     <polymer-ui-toolbar>
 *       <polymer-ui-icon-button src="menu.png" on-click="{{menuAction}}"></polymer-ui-icon-button>
 *       <div flex>Title</div>
 *       <polymer-ui-icon-button src="more.png" on-click="{{moreAction}}"></polymer-ui-icon-button>
 *     </polymer-ui-toolbar>
 *
 * polymer-ui-toolbar can adopt to smaller screen size.  If the attribute "responsive" is set
 * and the screen size is less than the responsiveWidth (default to 800px), the toolbar will
 * be moved to the bottom of the page.
 *
 * Example:
 *
 *     <polymer-ui-toolbar>
 *       <polymer-ui-icon-button icon="menu"></polymer-ui-icon-button>
 *       <div flex>Title</div>
 *       <polymer-ui-toolbar responsive>
 *         <polymer-ui-icon-button icon="add"></polymer-ui-icon-button>
 *         <polymer-ui-icon-button icon="trash"></polymer-ui-icon-button>
 *         <polymer-ui-icon-button icon="search"></polymer-ui-icon-button>
 *       </polymer-ui-toolbar>
 *     </polymer-ui-toolbar>
 */
@CustomTag('polymer-ui-toolbar')
class PolymerUiToolbar extends PolymerUiThemeAware{
  PolymerUiToolbar.created() : super.created();

  final _logger = new Logger('PolymerUiToolbar');
  
  @published String responsiveWidth = '800px';
  @observable bool queryMatches = false;
  @observable String mquery = '';

  void ready() {
    this.on['polymer-mediachange'].listen((CustomEvent e) {
      queryMatches = e.detail['matches'];
    });
    defaultTheme = 'polymer-ui-light-theme';
    responsiveWidthChanged(null);
  }
  
  void responsiveWidthChanged(old) {
    mquery = 'max-width: ${responsiveWidth}';
  }
  
  void queryMatchesChanged(oldValue) {
    this.classes.toggle('narrow-layout', this.queryMatches);
  }
  
  // child notifies with this event, that we should add 'flexbox' to class
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