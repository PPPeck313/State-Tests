import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/NotesStore.dart';

class MobxPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Fields
  //============================================================================

  NotesStore _state = NotesStore();

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return GenericPage(this);
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "MobX";



  @override
  Widget getList(BuildContext context) {
    return NotesList.mobX(_state);
  }// Use Observer to subscribe to updates to the NotesStore.



  @override
  void getAddNoteFunction(BuildContext context) => _state.addNote();

  @override
  Function(String p1) getUpdateInputFunction(BuildContext context) => _state.updateInput;
}