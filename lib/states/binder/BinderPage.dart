import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';

import 'models/CounterLogic.dart';
import 'models/NotesLogic.dart';

class BinderPage extends GenericPageState {
  @override
  Widget build(BuildContext context) => BinderScope(
        child: super.build(context),
      );

  @override
  String getTag() => 'Binder';

  @override
  CounterState getCounterState(BuildContext context) => context.watch(counterRef);

  @override
  void decrement(BuildContext context) => context.use(counterViewLogicRef).decrement();

  @override
  void increment(BuildContext context) => context.use(counterViewLogicRef).increment();

  @override
  NotesState getNotesState(BuildContext context) => context.watch(notesRef);

  @override
  void addNote(BuildContext context) => context.use(notesLogicRef).addNote();

  @override
  void updateInput(BuildContext context, String input) => context.use(notesLogicRef).updateInput(input);
}
