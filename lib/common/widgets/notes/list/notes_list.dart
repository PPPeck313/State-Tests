import 'package:flutter/widgets.dart';

import '../../../models/note/notes_state.dart';
import 'note_cell.dart';

class NotesList extends StatelessWidget {
  final Widget Function(Widget Function(NotesState) notesFunction) getStateWidgetFunction;

  const NotesList(this.getStateWidgetFunction, {super.key});

  @override
  Widget build(BuildContext context) => getList();

  Widget getList() => Expanded(
    child: getStateWidgetFunction(
      (state) => ListView.builder(
        itemBuilder: (context, index) => NoteCell(text: (state.notes[index])),
        itemCount: state.notes.length,
      ),
    ),
  );
}
