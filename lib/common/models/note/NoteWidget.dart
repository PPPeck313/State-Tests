import 'package:flutter/widgets.dart';

class NoteWidget extends StatelessWidget {
  final String text;

  const NoteWidget({super.key, this.text = ''});

  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Text('Note: $text'));
}
