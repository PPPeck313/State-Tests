import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/generic_page.dart';
import 'models/counter_logic.dart';
import 'models/notes_logic.dart';

class BinderPage extends GenericPageState {
  final CounterLogicController _counterLogicController;

  final NotesLogicController _notesLogicController;

  BinderPage(this._counterLogicController, this._notesLogicController);

  BinderPage.def() : this(CounterLogicController(), NotesLogicController());

  @override
  Widget build(BuildContext context) => BinderScope(child: super.build(context));

  @override
  CounterState getCounterState(BuildContext context) => context.watch(_counterLogicController.stateRef);

  @override
  void decrement(BuildContext context) => context.use(_counterLogicController.logicRef).decrement();

  @override
  void increment(BuildContext context) => context.use(_counterLogicController.logicRef).increment();

  @override
  NotesState getNotesState(BuildContext context) => context.watch(_notesLogicController.stateRef);

  @override
  void updateInput(BuildContext context, String input) =>
      context.use(_notesLogicController.logicRef).updateInput(input);

  @override
  void addNote(BuildContext context) => context.use(_notesLogicController.logicRef).addNote();
}
