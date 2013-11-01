import 'package:polymer/builder.dart';

void main(args) {
  build(entryPoints: [
                      'example/polymer_ui_arrow_demo.html',
                      'example/polymer_ui_icon_button.html',
                      'example/ui_arrow_example.html'
                      ],
                      options: parseOptions(args));
}