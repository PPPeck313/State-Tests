import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/states/mobx/models/NotesStoreX.dart';

import 'NoteWidget.dart';

class NotesList extends StatelessWidget {

  //============================================================================
  // Fields
  //============================================================================

  final NotesState? notesState;
  final NotesStoreX? notesStoreX;

  //============================================================================
  // Constructors
  //============================================================================

  NotesList(this.notesState) : notesStoreX = null;

  NotesList.mobX(this.notesStoreX) : notesState = null;

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return notesState != null ? getList() : Observer(builder: (_) => getList());
  } //MobX needs observable in Observer within sight

  Widget getList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => NoteWidget(text: (notesState != null ? notesState?.notes[index] : notesStoreX?.notes[index]) ?? ""),
        itemCount: notesState != null ? notesState?.notes.length : notesStoreX?.notes.length,
      ),
    );
  }
}