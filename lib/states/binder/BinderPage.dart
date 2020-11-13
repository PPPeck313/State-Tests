import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/CounterLogic.dart';
import 'models/NotesLogic.dart';

class BinderPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return BinderScope(
      child: GenericPage(this)
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Binder";



  @override
  Widget getCounterText(BuildContext context) {
    CounterState state = context.watch(CounterLogic.counterRef);
    return Text('${state.count}', style: new TextStyle(fontSize: 60.0));
  }

  @override
  void decrement(BuildContext context) {
    CounterLogic counterLogic = context.use(CounterLogic.counterLogicRef);
    counterLogic.decrement();
  }

  @override
  void increment(BuildContext context) {
    CounterLogic counterLogic = context.use(CounterLogic.counterLogicRef);
    counterLogic.increment();
  }



  @override
  Widget getNotesList(BuildContext context) {
    NotesState state = context.watch(NotesLogic.notesRef);
    return NotesList(state);
  }

  @override
  void addNote(BuildContext context) {
    NotesLogic notesLogic = context.use(NotesLogic.notesLogicRef);
    notesLogic.addNote();
  }

  @override
  void updateInput(BuildContext context, String input) {
    NotesLogic notesLogic = context.use(NotesLogic.notesLogicRef);
    notesLogic.updateInput(input);
  }
}