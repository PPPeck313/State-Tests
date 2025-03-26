import 'package:flutter/widgets.dart';

class NoteCell extends StatelessWidget {
  final String text;

  const NoteCell({this.text = '', super.key});

  @override
  Widget build(BuildContext context) =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Text('Note: $text'));
}
