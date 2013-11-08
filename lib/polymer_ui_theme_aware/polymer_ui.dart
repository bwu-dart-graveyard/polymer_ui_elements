library polymer_ui_elements.polymer_ui_theme_aware.polymer_ui;

import 'dart:html' show HtmlElement;

typedef validateThemeFunc(HtmlElement element, String theme, String activeTheme);

void validateTheme(HtmlElement element, String theme, String activeTheme) {
  
  if (theme == null || theme.isEmpty) {
    var p = element;
    while (p != null && (theme == null || theme.isEmpty)) {
      if(p is HtmlElement) {
        var t = p.attributes['theme'];
        if (t != null) {
          theme = t;
        }
      }
      p = p.parent;
    }
  }
  
  if (theme != null && theme.isNotEmpty) {
    activeTheme = theme;
  }
}