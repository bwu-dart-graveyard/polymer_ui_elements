## 0.1.3

* upgrade to polymer 0.10.0
* fix drone.io build (activate download of content_shell)

* port polymer-ui-iconset
  the `src` attribute is named `src2` as a workaround to make build succeed
* update polymer-ui-icon (uses now polymer-ui-iconset)
* port polymer-ui-action-icons
* fix theme issues 
* update polymer-ui-menu-button
* update polymer-ui-ratings
* update polymer-ui-scaffold (still not usable)
* remove old css files (were kept for compatibitlity with older selectors)
* update polymer-ui-theme-aware
* update polymer-ui-sidebar-menu
* fix nav-arrow in polymer-ui-sidbar-menu
* update polymer-ui-collapsible
* fix import elements in Dart code cause invalid cast exceptions
  values are cast to concrete types in all elements 
  to awoid warnings in DartEditor
* update polymer-ui-button
* update polymer-ui-toolbar and remove use of removed polymer-flex-area workaround
* fix issue with weekday in polymer-ui-clock


## 0.1.2

* polymer-ui-clock added

