import 'package:flutter/material.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

import 'list/notes_list.dart';

class Notes extends StatelessWidget {
  final TextEditingController _controller;

  final Widget Function(Widget) getStateWidgetFunction;
  final NotesState Function(BuildContext) getStateFunction;

  final void Function(BuildContext, String) updateInputFunction;
  final void Function(BuildContext) addNoteFunction;

  const Notes(
    this._controller,
    this.getStateWidgetFunction,
    this.getStateFunction,
    this.updateInputFunction,
    this.addNoteFunction, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: TextButton(
          onPressed: () {
            addNoteFunction(context);
            _controller.clear();
          },
          child: Text('Create Note'),
        ),
      ),
      TextField(
        controller: _controller,
        onChanged: (value) => updateInputFunction(context, value),
        decoration: InputDecoration.collapsed(hintText: 'Add a note'),
      ),
      Divider(),
      NotesList(getStateFunction(context)),
    ],
  );
}
