import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesList.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/CounterStore.dart';
import 'models/NotesStore.dart';

class ReduxPage extends StatelessWidget implements StatePage {
  const ReduxPage({super.key});

  final CounterStore _counterStore = CounterStore();
  final NotesStore _notesStore = NotesStore();

  @override
  Widget build(BuildContext context) => StoreProvider<CounterState>(
    store: _counterStore,
    child: StoreProvider<NotesState>(store: _notesStore, child: GenericPage(this)),
  );

  @override
  String getTag() => 'Redux';

  @override
  Widget getCounterText(BuildContext context) => StoreConnector<CounterState, CounterState>(
    converter: (store) => store.state,
    builder: (context, state) => Text('${state.count}', style: TextStyle(fontSize: 60.0)),
  );

  @override
  void decrement(BuildContext context) => _counterStore.dispatch(DecrementAction());

  @override
  void increment(BuildContext context) => _counterStore.dispatch(IncrementAction());

  @override
  Widget getNotesList(BuildContext context) => StoreConnector<NotesState, NotesState>(
    converter: (store) => store.state,
    builder: (context, state) => NotesList(state),
  );

  @override
  void addNote(BuildContext context) => _notesStore.dispatch(AddNoteAction());

  @override
  void updateInput(BuildContext context, String input) => _notesStore.dispatch(UpdateInputAction(input));
}
