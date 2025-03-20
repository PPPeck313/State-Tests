import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/states/mobx/models/NotesStoreX.dart';

import 'NoteWidget.dart';

class NotesList extends StatelessWidget {
  final NotesState? notesState;
  final NotesStoreX? notesStoreX;

  const NotesList(this.notesState, {super.key}) : notesStoreX = null;

  const NotesList.mobX(this.notesStoreX, {super.key}) : notesState = null;

  @override
  Widget build(BuildContext context) => notesState != null ? getList() : Observer(builder: (_) => getList()); //MobX needs observable in Observer within sight

  Widget getList() => Expanded(
    child: ListView.builder(
      itemBuilder:
          (context, index) =>
              NoteWidget(text: (notesState != null ? notesState?.notes[index] : notesStoreX?.notes[index]) ?? ''),
      itemCount: notesState != null ? notesState?.notes.length : notesStoreX?.notes.length,
    ),
  );
}
