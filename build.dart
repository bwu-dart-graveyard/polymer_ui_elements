import 'package:polymer/builder.dart';

void main(args) {
  build(entryPoints: ['example/polymer_ui_accordion.html',
                      'example/polymer_ui_arrow.html',
                      'example/polymer_ui_breadcrumbs.html',
                      'example/polymer_ui_card.html',
                      'example/polymer_ui_collapsible.html',
                      'example/polymer_ui_field.html',
                      'example/polymer_ui_icon_button.html',
                      'example/polymer_ui_icon_menu.html',
                      'example/polymer_ui_menu.html',
                      'example/polymer_ui_menu_item.html',
                      'example/polymer_ui_submenu_item.html',
                      'example/polymer_ui_toggle_button.html',
                      'example/polymer_ui_toolbar.html',
                      ],
                      options: parseOptions(args));
}