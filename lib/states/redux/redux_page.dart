import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../common/models/counter/counter_event.dart';
import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_event.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/counter_store.dart';
import 'models/notes_store.dart';

class ReduxPage extends GenericPageState {
  final CounterStore _counterStore = CounterStore();
  final NotesStore _notesStore = NotesStore();

  @override
  Widget? getCounterWidget(Widget child) => StoreProvider<CounterState>(store: _counterStore.store, child: child);

  @override
  CounterState getCounterState(BuildContext _) => _counterStore.state;

  @override
  void decrement(BuildContext context) => _counterStore.store.dispatch(DecrementEvent());

  @override
  void increment(BuildContext context) => _counterStore.store.dispatch(IncrementEvent());

  @override
  Widget? getNotesWidget(Widget child) => StoreProvider<NotesState>(store: _notesStore.store, child: child);

  @override
  NotesState getNotesState(BuildContext _) => _notesStore.state;

  @override
  void updateInput(BuildContext context, String input) => _notesStore.store.dispatch(UpdateInputEvent(input));

  @override
  void addNote(BuildContext context) => _notesStore.store.dispatch(AddNoteEvent());
}
