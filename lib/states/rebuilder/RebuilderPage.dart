import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/models/note/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:state_tests/states/rebuilder/models/CounterReactiveModel.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'models/NotesReactiveModel.dart';

class RebuilderPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Constructors
  //============================================================================

  const RebuilderPage();

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<CounterReactiveModel>(() => CounterReactiveModel()),
          Inject<NotesReactiveModel>(() => NotesReactiveModel())
        ],
        initState: () {}, //to be executed in the initState of statefulWidget
        afterInitialBuild: (BuildContext context) {}, //to be executed after each rebuild of the widget
        dispose: () {}, //to be executed in the dispose of statefulWidget
        appLifeCycle: (AppLifecycleState state) {}, //to be executed each time the application state changed; Android: onResume, onPause; iOS: viewWillAppear, viewWillDisappear
        builder: (context) {
          RM.get<CounterReactiveModel>(name: "CounterReactiveModel", context: context);
          RM.get<NotesReactiveModel>(name: "NotesReactiveModel", context: context);
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
  Widget getCounterText(BuildContext context) {
    CounterState state = RM.get<CounterReactiveModel>().state.state;
    return Text('${state.count}', style: new TextStyle(fontSize: 60.0));
  }

  @override
  void decrement(BuildContext context) {
    ReactiveModel<CounterReactiveModel> reactiveModel = RM.get<CounterReactiveModel>();
    reactiveModel.setState((s) => s.decrement());
  }

  @override
  void increment(BuildContext context) {
    ReactiveModel<CounterReactiveModel> reactiveModel = RM.get<CounterReactiveModel>();
    reactiveModel.setState((s) => s.increment());
  }



  @override
  Widget getNotesList(BuildContext context) {
    NotesState state = RM.get<NotesReactiveModel>().state.state;
    return NotesList(state);
  }

  @override
  void addNote(BuildContext context) {
    ReactiveModel<NotesReactiveModel> reactiveModel = RM.get<NotesReactiveModel>();
    reactiveModel.setState((state) => state.addNote());
  }

  @override
  void updateInput(BuildContext context, String input) {
    //IN.get<NotesReactiveModel>().updateInput(input);
    ReactiveModel<NotesReactiveModel> reactiveModel = RM.get<NotesReactiveModel>();
    reactiveModel.setState((s) => s.updateInput(input));
  }
}