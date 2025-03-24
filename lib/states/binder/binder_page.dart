import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/counter_logic.dart';
import 'models/notes_logic.dart';

class BinderPage extends GenericPageState {
  @override
  late CounterLogic counterViewModel;
  late LogicRef<CounterLogic> _counterLogicRef;

  @override
  late NotesLogic notesViewModel;
  late LogicRef<NotesLogic> _notesLogicRef;

  BinderPage() {
    _counterLogicRef = LogicRef((scope) => counterViewModel = CounterLogic(scope));
    _notesLogicRef = LogicRef((scope) => notesViewModel = NotesLogic(scope));
  }

  @override
  Widget build(BuildContext context) => BinderScope(child: super.build(context));

  @override
  CounterState getCounterState(BuildContext context) => context.watch(counterViewModel.counterStateRef);

  @override
  void decrement(BuildContext context) => context.use(_counterLogicRef).decrement();

  @override
  void increment(BuildContext context) => context.use(_counterLogicRef).increment();

  @override
  NotesState getNotesState(BuildContext context) => context.watch(notesViewModel.notesStateRef);

  @override
  void updateInput(BuildContext context, String input) => context.use(_notesLogicRef).updateInput(input);

  @override
  void addNote(BuildContext context) => context.use(_notesLogicRef).addNote();
}
