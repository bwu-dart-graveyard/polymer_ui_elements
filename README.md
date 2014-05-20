# Basic visual elements for Polymer.dart

A port of polymer.js' [polymer-ui-elements](http://www.polymer-project.org/docs/elements/polymer-ui-elements.html) to Polymer.dart.
The intent of the authors is to contribute the work to the Dart project itself (https://www.dartlang.org).

### Non-visual elements for Dart can be found in
* [polymer_elements](https://github.com/bwu-dart/polymer_elements)


## Documentation
* The Dart source files of an element often contain some documentation (Dartdoc) how to use the element. You can also find this documentation online at  
* [DartDoc](http://bwu-dart.github.io/polymer_elements/docs/index.html)
* Almost each element has an associated demo page which shows how to use the element. 
Open the 'demo' links below to take a look.
The source code of these demo pages can be found in the [example subdirectory of the package](https://github.com/bwu-dart/polymer_ui_elements/tree/master/example). 
The actual implementation of the demo page is often outsourced to files in the `example/src/element_name` subdirectory.


## Usage
* add the following to your pubspec.yaml file: 

```yaml
dependencies:
  polymer_ui_elements:
```

## Feedback

Your feedback is very much appreciated. We are excited to hear about your experience using polymer_ui_elements.
We need your feedback to continually improve the qualtiy.

Just [Create a New Issue](https://github.com/bwu-dart/polymer_ui_elements/issues/new) 


## General notes

* Tested with Dart SDK version 1.3.0-dev.7.11

### Status

* Status `(ported)` means it is ported but not yet usable

Element name               |   Status    | Comment          | Demo
-------------------------- | ----------- | ---------------- | ----
polymer-ui-accordion       | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_accordion.html)
polymer&#8209;ui&#8209;animated&#8209;pages  | not started |                  |     
polymer-ui-arrow           | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_arrow.html)
polymer-ui-breadcrumbs     | ported      |              		| [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_breadcrumbs.html)     
polymer-ui-card            | (ported)    | depends on pointer events which are not yet available | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_card.html) 
polymer-ui-clock           | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_clock.html)
polymer-ui-collapsible     | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_collapsible.html)     
polymer-ui-dark-theme      | not started |                  |      
polymer-ui-field           | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_field.html)
polymer-ui-icon            | ported      |              		| [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_icon.html)     
polymer-ui-icon-button     | ported      |        					| [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_icon_button.html)     
polymer-ui-iconset         | ported      | 					        | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_iconset.html)     
polymer-ui-light-theme     | not started | 				        	|      
polymer-ui-line-chart      | not started | 					        |      
polymer-ui-menu            | ported      |              		| [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_menu.html)     
polymer-ui-menu-button     | (ported)    | depends on polymer-overlay which are not ye ported | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_menu_button.html), [demo (parallax)](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_menu_button_parallax.html)
polymer-ui-menu-item       | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_menu_item.html)     
polymer-ui-nav-arrow       | ported      |              		| [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_nav_arrow.html)
polymer-ui-overlay         | not started |                  |
polymer-ui-pages           | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_pages.html)
polymer-ui-ratings         | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_ratings.html)
polymer-ui-scaffold        | (ported)    | depends on polymer-overlay which is not yet ported  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_scaffold.html)
polymer-ui-sidebar         | (ported)    |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_sidebar.html)
polymer-ui-sidebar-header  | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_sidebar_header.html)
polymer-ui-sidebar-menu    | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_sidebar_menu.html)
polymer-ui-splitter        | (ported)    | depends on pointer events which are not yet available | <!-- [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_splitter.html) -->
polymer-ui-stock           | not started |                  | 
polymer-ui-submenu-item    | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_submenu_item.html)
polymer-ui-tabs            | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_tabs.html)
polymer-ui-theme-aware     | ported      |                  | (has no demo page)
polymer-ui-toggle-button   | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_toggle_button.html)
polymer-ui-toolbar         | ported      |                  | [demo](http://bwu-dart.github.io/polymer_elements/build_ui/polymer_ui_toolbar.html)    
polymer-ui-weather         | not started |                  |    


### License
BSD 3-clause license (see [LICENSE](https://github.com/bwu-dart/polymer-ui_elements/blob/master/LICENSE) file).

[![Build Status](https://drone.io/github.com/bwu-dart/polymer_ui_elements/status.png)](https://drone.io/github.com/bwu-dart/polymer_ui_elements/latest)
