import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../../models/note/notes_state.dart';

class NotesList extends StatelessWidget {
  final NotesState state;

  const NotesList(this.state, {super.key});

  @override
  Widget build(BuildContext context) => getList();

  Widget getList() => Expanded(
    child: ListView.builder(
      itemBuilder: (context, index) => noteCell((state.notes[index])),
      itemCount: state.notes.length,
    ),
  );

  @swidget
  Widget noteCell(String text) =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Text('Note: $text'));
}
