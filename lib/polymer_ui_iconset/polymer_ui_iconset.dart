// Copyright (c) 2013, the polymer_elements.dart project authors.  Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.
// This work is a port of the polymer-elements from the Polymer project,
// http://www.polymer-project.org/.
library polymer_ui_elements.polymer_ui_iconset;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
import 'package:polymer_elements/polymer_meta/polymer_meta.dart' show
    PolymerMeta;

/**
 * polymer-ui-iconset allows users to define their own icon sets.
 *
 * Example:
 *
 *     <polymer-ui-iconset id="my-icons" src="packages/polymer_ui_elements/polymer_ui_iconset/my_icons.png" width="96" iconsize="24"
 *         icons="location place starta stopb bus car train walk">
 *     </polymer-ui-iconset>
 *
 * The above will automatically register the icon set "my-icons" to the iconset
 * database.  To use the user-defined icon set, prefix the icon with
 * the icon set e.g. "my-icons:clock"
 *
 * Example:
 *
 *     <polymer-ui-icon-button icon="my-icons:car"></polymer-ui-icon-button>
 */

@CustomTag('polymer-ui-iconset')
class PolymerUiIconset extends PolymerMeta {
  PolymerUiIconset.created(): super.created() {
    _logger.finest('created');
  }

  final _logger = new Logger('PolymerUiIconset');

  @published
  String src;
  @published
  int width = 0;
  @published
  String icons;
  @published
  int iconsize = 0;

  int offsetx = 0;
  int offsety = 0;
  String type = 'iconset';
  Map iconMap;
  Map themes = {};

  @override
  void ready() {
    super.ready();
    // TODO(sorvell): ensure iconset's src is always relative to the main
    // document
    if ((this.src != null && this.src.isNotEmpty) && (this.ownerDocument !=
        document)) {

      // TODO zoechi when is this called?
      //this.src = this.resolvePath(this.src, this.baseUri);
      this.baseUri(); // an attempt but no use case
    }
    var x = this.ownerDocument;
    super.ready();
    this.iconsChanged();
    this.updateThemes();
  }

  void iconsChanged() {
    this.iconMap = {};
    var ox = this.offsetx;
    var oy = this.offsety;
    //print('iconChanged: id: $id, icons: ${this.icons}');
    if (this.icons != null && this.icons.isNotEmpty) {
      this.icons.split(new RegExp(r'\s+')).forEach((String name) {
        this.iconMap[name] = {
          'offsetx': ox,
          'offsety': oy
        };

        if (ox + this.iconsize < this.width) {
          ox += this.iconsize;
        } else {
          ox = this.offsetx;
          oy += this.iconsize;
        }
        //print('iconsChanged: $id, name: $name, ox: $ox, oy: $oy');
      });
    }
  }

  void updateThemes() {
    //print('updateThemes- id: ${this.id}');
    //this.children.forEach((e) => print('  child ${e.localName}'));

    this.themes = {};

    var ts = this.querySelectorAll('property[theme]');
    if (ts != null) {
      ts.forEach((t) {
        var xs = t.attributes['offsetx'];
        var xi = 0;
        if(xs != null) {
          xi = int.parse(xs, onError: (s) => 0);
        }
        var ys = t.attributes['offsety'];
        var yi = 0;
        if(ys != null) {
          yi = int.parse(ys, onError: (s) => 0);
        }

        this.themes[t.attributes['theme']] = {
          'offsetx': xi,
          'offsety': yi
        };
      });
    }
  }

  // TODO(ffu): support retrived by index e.g. getOffset(10);
  Map getOffset(String icon, String theme) {
    var i = this.iconMap[icon];
    var t = this.themes[theme];
    if ((i != null) && (t != null)) {
      return {
        'offsetx': i['offsetx'] + t['offsetx'],
        'offsety': i['offsety'] + t['offsety']
      };
    }
    return i;
  }

  String baseUri() {
    //var x = (this.ownerDocument.querySelector('#iconset') as LinkElement).href;
    //print(x);
    return '';
  }
}
