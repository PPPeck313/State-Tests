import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/models/NotesActions.dart';

import 'models/NotesStore.dart';

class ReduxPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Fields
  //============================================================================

  NotesStore _state = NotesStore();

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return StoreProvider<NotesState>(
        store: _state,
        child: GenericPage(this)
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Redux";



  @override
  Widget getList(BuildContext context) {
    return StoreConnector<NotesState, NotesState>(
        converter: (store) => store.state,
        builder: (context, state) => NotesList(state)
    );
  }



  @override
  void getAddNoteFunction(BuildContext context) => _state.dispatch(AddNoteAction());

  @override
  Function(String p1) getUpdateInputFunction(BuildContext context) => (p1) {
    _state.dispatch(UpdateInputAction(p1));
  };
}