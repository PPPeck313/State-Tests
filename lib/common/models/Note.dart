import 'package:flutter/widgets.dart';

class Note extends StatelessWidget {

  //============================================================================
  // Fields
  //============================================================================

  final String text;

  //============================================================================
  // Constructors
  //============================================================================

  const Note({Key key, this.text}) : super(key: key);

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text('Note: $text'),
    );
  }
}