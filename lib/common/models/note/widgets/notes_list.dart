import 'package:flutter/cupertino.dart';

import '../notes_state.dart';
import 'note_widget.dart';

class NotesList extends StatelessWidget {
  final NotesState notesState;

  const NotesList(this.notesState, {super.key});

  @override
  Widget build(BuildContext context) => getList();

  Widget getList() => Expanded(
    child: ListView.builder(
      itemBuilder: (context, index) => NoteWidget(text: (notesState.notes[index])),
      itemCount: notesState.notes.length,
    ),
  );
}
