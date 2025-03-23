import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/counter_logic.dart';
import 'models/notes_logic.dart';

class BinderPage extends GenericPageState {
  late CounterLogic _counterLogic;
  late LogicRef<CounterLogic> _counterLogicRef;

  late NotesLogic _notesLogic;
  late LogicRef<NotesLogic> _notesLogicRef;

  BinderPage() {
    _counterLogicRef = LogicRef((scope) => _counterLogic = CounterLogic(scope));
    _notesLogicRef = LogicRef((scope) => _notesLogic = NotesLogic(scope));
  }

  @override
  Widget build(BuildContext context) => BinderScope(child: super.build(context));

  @override
  CounterState getCounterState(BuildContext context) => context.watch(_counterLogic.counterStateRef);

  @override
  void decrement(BuildContext context) => context.use(_counterLogicRef).decrement();

  @override
  void increment(BuildContext context) => context.use(_counterLogicRef).increment();

  @override
  NotesState getNotesState(BuildContext context) => context.watch(_notesLogic.notesStateRef);

  @override
  void updateInput(BuildContext context, String input) => context.use(_notesLogicRef).updateInput(input);

  @override
  void addNote(BuildContext context) => context.use(_notesLogicRef).addNote();
}
