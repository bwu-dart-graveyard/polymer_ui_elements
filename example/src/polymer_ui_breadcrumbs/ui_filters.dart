// borrowed from https://github.com/sethladd/dart-polymer-dart-examples/blob/master/web/bind_number_to_text_field_with_filter/ui_filters.dart

library filters;

import 'package:polymer_expressions/filter.dart';

class StringToInt extends Transformer<String, int> {
  final int radix;
  StringToInt({this.radix: 10});
  String forward(int i) => '$i';
  int reverse(String s) => s == null ? null : int.parse(s, radix: radix, onError: (s) => null);
}