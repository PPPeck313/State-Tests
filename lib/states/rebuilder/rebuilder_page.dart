import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/counter_rebuilder.dart';
import 'models/notes_rebuilder.dart';

class RebuilderPage extends GenericPageState {
  CounterRebuilder counterRebuilder = CounterRebuilder();
  NotesRebuilder notesRebuilder = NotesRebuilder();

  RebuilderPage() : counterRebuilder = CounterRebuilder(), notesRebuilder = NotesRebuilder();

  // local scope = inherited widget
  // @override
  // Widget? getCounterWidget(Widget child) =>
  //     counterRebuilder.injectedState.inherited(builder: (_) => child, stateOverride: () => counterRebuilder.state);

  @override
  CounterState getCounterState(BuildContext _) => counterRebuilder.state; // counterRebuilder.injectedState.of(context);

  @override
  void decrement(BuildContext _) => counterRebuilder.decrement();

  @override
  void increment(BuildContext _) => counterRebuilder.increment();

  // local scope = inherited widget
  // @override
  // Widget? getNotesWidget(Widget child) =>
  //     notesRebuilder.injectedState.inherited(builder: (_) => child, stateOverride: () => notesRebuilder.state);

  @override
  NotesState getNotesState(BuildContext _) => notesRebuilder.state; // notesRebuilder.injectedState.of(context);

  @override
  void updateInput(BuildContext _, String input) => notesRebuilder.updateInput(input);

  @override
  void addNote(BuildContext _) => notesRebuilder.addNote();
}
