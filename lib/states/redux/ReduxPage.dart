import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_tests/common/models/counter/CounterActions.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/models/note/NotesActions.dart';

import 'models/CounterStore.dart';
import 'models/NotesStore.dart';

class ReduxPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Fields
  //============================================================================

  CounterStore _counterStore = CounterStore();
  NotesStore _notesStore = NotesStore();

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: _counterStore,
      child: StoreProvider<NotesState>(
          store: _notesStore,
          child: GenericPage(this)
      ),
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Redux";




  @override
  Widget getCounterText(BuildContext context) {
    return StoreConnector<CounterState, CounterState>(
        converter: (store) => store.state,
        builder: (context, state) => Text('${state.count}', style: new TextStyle(fontSize: 60.0))
    );
  }

  @override
  void decrement(BuildContext context) => _counterStore.dispatch(DecrementAction());

  @override
  void increment(BuildContext context) => _counterStore.dispatch(IncrementAction());



  @override
  Widget getNotesList(BuildContext context) {
    return StoreConnector<NotesState, NotesState>(
        converter: (store) => store.state,
        builder: (context, state) => NotesList(state)
    );
  }

  @override
  void addNote(BuildContext context) => _notesStore.dispatch(AddNoteAction());

  @override
  void updateInput(BuildContext context, String input) => _notesStore.dispatch(UpdateInputAction(input));
}