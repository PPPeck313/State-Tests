import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/NotesLogic.dart';

class BinderPage extends StatefulWidget {

  //============================================================================
  // Constructors
  //============================================================================

  const BinderPage({Key key}) : super(key: key);

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  _BinderPageState createState() => _BinderPageState();
}



class _BinderPageState extends State<BinderPage> implements StatePage {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return BinderScope(
      child: GenericPage(this)
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Binder";



  @override
  Widget getList(BuildContext context) {
    NotesState state = context.watch(NotesLogic.notesRef);
    return NotesList(state);
  }// Use Observer to subscribe to updates to the NotesStore.



  @override
  void getAddNoteFunction(BuildContext context) => context.use(NotesLogic.notesLogicRef).addNote();

  @override
  Function(String p1) getUpdateInputFunction(BuildContext context) => context.use(NotesLogic.notesLogicRef).updateInput;
}