library polymer_ui_elements.polymer_ui_theme_aware.polymer_ui;

import 'dart:html' show HtmlElement;

typedef validateThemeFunc(HtmlElement element, {String theme, String activeTheme, String defaultTheme});

String validateTheme(HtmlElement element, {String theme, String activeTheme, String defaultTheme}) {
  var newTheme = theme;  
  if (theme == null || theme.isEmpty) {
    var p = element;
    while (p != null && (newTheme == null || newTheme.isEmpty)) {
      if(p is HtmlElement) {
        var t = p.attributes['theme'];
        if (t != null) {
          newTheme = t;
        }
      }
      p = p.parent;
    }
  }
  
  if (theme != null && theme.isNotEmpty) {
    return theme;
  } else if (newTheme != null && newTheme.isNotEmpty){
    return newTheme;
  }
  return defaultTheme;
}