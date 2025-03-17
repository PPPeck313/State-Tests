import 'package:flutter/widgets.dart';

class NoteWidget extends StatelessWidget {

  //============================================================================
  // Fields
  //============================================================================

  final String text;

  //============================================================================
  // Constructors
  //============================================================================

  const NoteWidget({super.key, this.text = ""});

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text('Note: $text'),
  );
}