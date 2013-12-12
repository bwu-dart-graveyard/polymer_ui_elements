# Basic visual elements for Polymer.dart

A port of polymer.js' [polymer-ui-elements](https://github.com/Polymer/polymer-ui-elements) to Polymer.dart.
The intent of the authors is to contribute the work to the Dart project itself (https://www.dartlang.org).

### Non-visual elements for Dart can be found in
* [polymer_elements](https://github.com/ErikGrimes/polymer_elements)

## Documentation
* The Dart source files of an element often contains some documentation (Dartdoc) how to use the element. You can find the documentation online at  
* [DartDoc](http://erikgrimes.github.io/polymer_elements/docs/index.html)
    
    We were not yet able to build a JavaScript version for the demo pages of the polymer_ui_elements.
    The high number of entry pages (examples) in this library leads to *out of memory* errors with pub build. 
    Just using the polymer_ui_elements in your app won't lead to this kind of error.
    
    The demo pages linked below are from an earlier build and have been improved a lot since then. 

The source code of these demo pages can be found in the [example subdirectory of the package](https://github.com/ErikGrimes/polymer_ui_elements/tree/master/example). 
The actual implementation of the demo page is often outsourced to files in the `examples/src/element_name` subdirectory.

## Usage
* add the following to your pubspec.yaml file: 

```yaml
dependencies:
  polymer_ui_elements:
```

* to import a polymer_ui_element into your entry page HTML file, add the following line inside the `<head>` tag before any of the Dart and polymer `<script>` tags: 
  
```html  
    <link rel="import" href="packages/polymer_ui_elements/polymer_ui_accordion/polymer_ui_accordion.html">
```

* to import a polymer_ui_element into any of your custom polymer elements, add the following line into your Polymer element HTML file before the `<polymer-element name="my-element">` start tag:
  
```html
    <link rel="import" href="../../../packages/polymer_ui_elements/polymer_ui_icon/polymer_ui_icon.html">
```

## General notes

* Current development status requires Dart SDK Dart version 1.0.3.0_r30939 (DEV)

### Status

Element name               |   Status    | Comment          | Demo
-------------------------- | ----------- | ---------------- | ----
polymer-ui-accordion       | ported      |                  | [demo](http://erikgrimes.github.io/polymer_ui_elements/build_ui/polymer_ui_accordion.html)
polymer&#8209;ui&#8209;animated&#8209;pages  | not started |                  |     
polymer-ui-arrow           | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_arrow.html)
polymer-ui-breadcrumbs     | ported      |              		| [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_breadcrumbs.html)     
polymer-ui-card            | ported      | depends on pointer events which are not yet available | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_card.html) 
polymer-ui-clock           | not&nbsp;started |                  | 
polymer-ui-collapsible     | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_collapsible.html)     
polymer-ui-dark-theme      | not started |                  |      
polymer-ui-field           | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_field.html)
polymer-ui-icon            | ported      |              		| [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_icon.html)     
polymer-ui-icon-button     | **ported**  |        					| [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_icon_button.html)     
polymer-ui-iconset         | not started | 					        |      
polymer-ui-light-theme     | not started | 				        	|      
polymer-ui-line-chart      | not started | 					        |      
polymer-ui-menu            | ported      |              		| [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_menu.html)     
polymer-ui-menu-button     | ported      | depends on polymer-overlay which are not ye ported | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_menu_button.html), [demo (parallax)](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_menu_button_parallax.html)
polymer-ui-menu-item       | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_menu_item.html)     
polymer-ui-nav-arrow       | ported      |              		| [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_nav_arrow.html)
polymer-ui-overlay         | not started |                  |
polymer-ui-pages           | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_pages.html)
polymer-ui-ratings         | **ported**  |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_ratings.html)
polymer-ui-scaffold        | ported      | depends on polymer-overlay which is not yet ported  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_scaffold.html)
polymer-ui-sidebar         | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_sidebar.html)
polymer-ui-sidebar-header  | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_sidebar_header.html)
polymer-ui-sidebar-menu    | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_sidebar_menu.html)
polymer-ui-splitter        | ported      | depends on pointer events which are not yet available | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_splitter.html)
polymer-ui-stock           | not started |                  | 
polymer-ui-submenu-item    | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_submenu_item.html)
polymer-ui-tabs            | ported      | has issues       | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_tabs.html)
polymer-ui-theme-aware     | **ported**  |                  | (has no demo page)
polymer-ui-toggle-button   | **ported**  |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_toggle_button.html)
polymer-ui-toolbar         | ported      |                  | [demo](http://erikgrimes.github.io/polymer_elements/build_ui/polymer_ui_toolbar.html)    
polymer-ui-weather         | not started |                  |    


### License
BSD 3-clause license (see [LICENSE](https://github.com/ErikGrimes/polymer-ui_elements/blob/master/LICENSE) file).

[![Build Status](https://drone.io/github.com/ErikGrimes/polymer_ui_elements/status.png)](https://drone.io/github.com/ErikGrimes/polymer_ui_elements/latest)


