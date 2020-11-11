import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/NotesNotifier.dart';

class RiverPodPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: GenericPage(this)
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Riverpod";



  @override
  Widget getList(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        var state = watch(NotesNotifier.notesProvider.state);
        return NotesList(state);
      }
    );
  } // Subscribe to the NotesController's state



  @override
  void getAddNoteFunction(BuildContext context) => context.read(NotesNotifier.notesProvider).addNote();

  @override
  Function(String p1) getUpdateInputFunction(BuildContext context) => context.read(NotesNotifier.notesProvider).updateInput;
}