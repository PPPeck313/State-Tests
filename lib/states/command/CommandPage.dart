import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/NotesCommand.dart';

class CommandPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Fields
  //============================================================================

  final _notesCommand = NotesCommand();

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
  String getTag() => "Command";



  @override
  Widget getList(BuildContext context) {
    return ValueListenableBuilder<NotesState>(
      valueListenable: _notesCommand.updateNotesCommand,
      builder: (context, state, _) => NotesList(state)
    );
  }



  @override
  void getAddNoteFunction(BuildContext context) => _notesCommand.updateNotesCommand.execute(_notesCommand.inputChangedCommand.value);

  @override
  Function(String p1) getUpdateInputFunction(BuildContext context) => _notesCommand.inputChangedCommand;
}