// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_toolbar;

import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
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

  void queryMatchesChanged(oldValue) {
    this.classes.toggle('narrow-layout', this.queryMatches);
  }
}