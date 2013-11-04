import 'package:polymer/builder.dart';

void main(args) {
  build(entryPoints: [
                      'web/polymer_ui_accordion.html',
                      'web/polymer_ui_arrow_demo.html',
                      'web/polymer_ui_collapsible.html'
                      'web/polymer_ui_icon_button.html',
                      'web/polymer_ui_toggle_button.html',
                      'web/polymer_ui_toolbar.html',
                      'web/ui_arrow_example.html'
/*
                      'example/polymer_ui_accordion.html',
                      'example/polymer_ui_arrow_demo.html',
                      'web/polymer_ui_collapsible.html',
                      'example/polymer_ui_icon_button.html',
                      'example/polymer_ui_toggle_button.html',
                      'example/polymer_ui_toolbar.html',
                      'example/ui_arrow_example.html'
*/
                      ],
                      options: parseOptions(args));
}