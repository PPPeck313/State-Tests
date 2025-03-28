import 'package:flutter/widgets.dart';

import '../../../models/note/notes_state.dart';
import 'note_cell.dart';

class NotesList extends StatelessWidget {
  final NotesState notesState;

  const NotesList(this.notesState, {super.key});

  @override
  Widget build(BuildContext context) => getList();

  Widget getList() => Expanded(
    child: ListView.builder(
      itemBuilder: (context, index) => NoteCell(text: (notesState.notes[index])),
      itemCount: notesState.notes.length,
    ),
  );
}
