// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see 
// the AUTHORS file for details. All rights reserved. Use of this source code is 
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project, 
// http://www.polymer-project.org/. 
library polymer_ui_elements.polymer_ui_breadcrumbs;

import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';

/**
 * polymer-ui-breadcrumbs shows the user where they are in relation to a
 * hierarchy.  Use 'crumbs' property to specify the content for breadcumbs.
 *
 * Example: 
 *
 *     <polymer-ui-breadcrumbs crumbs="{{crumbs}}" selectedCrumb="{{crumb}}"></polymer-ui-breadcrumbs>
 *
 *     ....
 *     this.crumbs = [
 *       {label: 'Overview'}, 
 *       {label: 'Subitem1'}, 
 *       {label: 'Subitem2'},
 *       {label: 'Subitem3'}
 *     ];
 */
@CustomTag('polymer-ui-breadcrumbs')
class PolymerUiBreadcrumbs extends PolymerElement {
  PolymerUiBreadcrumbs.created() : super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('PolymerUiBreadcrumbs');
  
  /**
   * An array of objects describing the content for breadcrumbs.
  *
   * Example:
  *
   *     this.crumbs = [
   *       {label: 'Overview'}, 
   *       {label: 'Subitem1'}, 
   *       {label: 'Subitem2'},
   *       {label: 'Subitem3'}
   *     ];
   */
  @published List crumbs = [];

  /**
   * The index of the selected crumb.
   */
  @published int selected;
  
  /**
   * Returns the model associated with the selected crumb.
  *
   * @attribute selectedCrumb
   * @type object
   * @default null
   */
  @published var selectedCrumb;
  
  @override
  void enteredView() {
    super.enteredView();
  }
}
