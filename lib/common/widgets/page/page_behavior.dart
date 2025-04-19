import 'package:flutter/material.dart';

import '../../models/base_counter_view_model.dart';
import '../../models/base_notes_view_model.dart';
import '../../models/counter/counter_state.dart';
import '../../models/note/notes_state.dart';
import '../counter/counter.dart';

abstract mixin class PageBehavior {
  @protected
  BaseCounterViewModel? get counterViewModel => null;

  @protected
  BaseNotesViewModel? get notesViewModel => null;

  Widget getCounterWidget(Widget Function(CounterState) counter) => counter(counterViewModel?.state ?? CounterState());
  void increment(BuildContext context) => counterViewModel?.increment();
  void decrement(BuildContext context) => counterViewModel?.decrement();

  Widget getNotesWidget(Widget Function(NotesState) notes) => notes(notesViewModel?.state ?? NotesState());
  void updateInput(BuildContext context, String input) => notesViewModel?.updateInput(input);
  void addNote(BuildContext context) => notesViewModel?.addNote();

  Widget buildPage(BuildContext context, TextEditingController controller) => Scaffold(
    body: Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
      child: Column(
        children: [
          Counter(getCounterWidget, decrement, increment),
          //Notes(controller, getNotesWidget, updateInput, addNote),
        ],
      ),
    ),
  );
}
