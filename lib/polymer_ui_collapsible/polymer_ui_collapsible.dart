// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.
library polymer_ui_elements.polymer_ui_collapsible;

import 'package:polymer/polymer.dart';

/**
 * polymer-ui-collapsible has a header and a body and the body appears or
 * disappears based on "active" property.  Tapping on the header will toggle
 * the active state.  User needs to put the class "polymer-ui-collapsible-header"
 * on the element to indicate it represents a header.
 *
 * Example:
 *
 *     <polymer-ui-collapsible>
 *       <div class="polymer-ui-collapsible-header">Title</div>
 *       <div>
 *         some content...
 *       </div>
 *     </polymer-ui-collapsible>
 */
@CustomTag('polymer-ui-collapsible')
class PolymerUiCollapsible extends PolymerElement {
  PolymerUiCollapsible.created() : super.created();

  /**
   * If true, tapping on the header will not toggle the active state.
   */
  @published bool notap = false;

  /**
   * If true, the body is expanded.
   */
  @published bool active = false;

  /**
   * Toggle the active state of the collapsible.
   */
  void toggle() {
    this.active = !this.active;
  }

  void headerTap() {
    if (!this.notap) {
      this.toggle();
    }
  }

  void bodyTap(e) {
    e.notap = true;
  }
}