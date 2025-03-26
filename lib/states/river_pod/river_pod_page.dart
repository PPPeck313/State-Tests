import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/pages/generic_page.dart';

class RiverPodPage extends GenericPageState {
  @override
  final CounterStore counterViewModel = CounterStore();

  @override
  final NotesStore notesViewModel = NotesStore();

  @override
  Widget? getCounterWidget(Widget child) => StoreProvider<CounterState>(store: counterViewModel.store, child: child);

  @override
  void decrement(BuildContext context) => counterViewModel.store.dispatch(DecrementEvent());

  @override
  void increment(BuildContext context) => counterViewModel.store.dispatch(IncrementEvent());

  @override
  Widget? getNotesWidget(Widget child) => StoreProvider<NotesState>(store: notesViewModel.store, child: child);

  @override
  void updateInput(BuildContext context, String input) => notesViewModel.store.dispatch(UpdateInputEvent(input));

  @override
  void addNote(BuildContext context) => notesViewModel.store.dispatch(AddNoteEvent());
}
