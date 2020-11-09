import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/states/mobx/models/NotesStore.dart';

import '../models/Note.dart';

class NotesList extends StatelessWidget {

  //============================================================================
  // Fields
  //============================================================================

  NotesState notesState;
  NotesStore notesStore;

  //============================================================================
  // Constructors
  //============================================================================

  NotesList(this.notesState);

  NotesList.mobX(this.notesStore);

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
        itemBuilder: (context, index) => Note(text: notesState != null ? notesState.notes[index] : notesStore.notes[index]),
        itemCount: notesState != null ? notesState.notes.length : notesStore.notes.length,
      ),
    );
  }
}