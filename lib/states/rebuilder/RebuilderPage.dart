import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'models/NotesReactiveModel.dart';

class RebuilderPage extends StatefulWidget {

  //============================================================================
  // Constructors
  //============================================================================

  const RebuilderPage({Key key}) : super(key: key);

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  _RebuilderPageState createState() => _RebuilderPageState();
}



class _RebuilderPageState extends State<RebuilderPage> implements StatePage {

  //============================================================================
  // Fields
  //============================================================================

  ReactiveModel<NotesReactiveModel> _state;

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<NotesReactiveModel>(() => NotesReactiveModel.initial())
        ],
        initState: () {}, //to be executed in the initState of statefulWidget
        afterInitialBuild: (BuildContext context) {}, //to be executed after each rebuild of the widget
        dispose: () {}, //to be executed in the dispose of statefulWidget
        appLifeCycle: (AppLifecycleState state) {}, //to be executed each time the application state changed; Android: onResume, onPause; iOS: viewWillAppear, viewWillDisappear
        builder: (context) {
          _state = RM.get<NotesReactiveModel>(name: "NotesReactiveModel", context: context);
          return GenericPage(this);
        }
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Rebuilder";



  @override
  Widget getList(BuildContext context) {
    var state = _state.state.state;
    return NotesList(state);
  }



  @override
  void getAddNoteFunction(BuildContext context) => _state.setState((s) => s.addNote());

  @override
  Function(String p1) getUpdateInputFunction(BuildContext context) => IN.get<NotesReactiveModel>().updateInput;
}