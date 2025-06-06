extension StringExtension on String {
  String get toCapitalized => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get toTitleCase => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized).join(' ');

  String get decodeUnicode => String.fromCharCode(int.parse(replaceFirst('U+', ''), radix: 16));

  String get bold => '<b>$this</b>';
  String get preserve => '<pre>$this</pre>';

  String get toSimpleWidget => replaceAll(RegExp(r'\(.*\)'), '').replaceAll('<', '&lt;').replaceAll('>', '&gt;');

  String toDetailedWidget(String indent, String tab) {
    final buffer = StringBuffer();
    int angleDepth = 0;

    for (int i = 0; i < length; i++) {
      final char = this[i];
      if (char == '<') angleDepth++;
      if (char == '>') angleDepth--;

      buffer.write(switch (char) {
        ',' => (angleDepth == 0) ? ',\n$indent$tab' : char,
        '(' => '(\n$indent$tab ',
        ')' => '\n$indent)',
        '<' => '&lt;',
        '>' => '&gt;',
        _ => char,
      });
    }

    return buffer.toString();
  }
}

extension StringNullableExtension on String? {
  String get orEmpty => this ?? '';
}
