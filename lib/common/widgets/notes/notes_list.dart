import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import 'package:state_tests/common/models/note/notes_state.dart';

part 'notes_list.g.dart';

class NotesList extends StatelessWidget {
  final NotesState state;

  const NotesList(this.state, {super.key});

  @override
  Widget build(BuildContext context) => getList();

  Widget getList() => Column(
    children: [
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => NoteCell(state.notes.length - index, state.notes.reversed.elementAt(index)),
        itemCount: state.notes.length,
        padding: EdgeInsets.zero,
      ),
    ],
  );
}

@swidget
Widget noteCell(int index, String text) => Text.rich(
  TextSpan(
    children: [TextSpan(text: 'Note $index: ', style: TextStyle(fontWeight: FontWeight.bold)), TextSpan(text: text)],
  ),
);
