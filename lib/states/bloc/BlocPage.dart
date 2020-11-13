import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_tests/common/models/counter/CounterActions.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesActions.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/states/bloc/models/CounterBloc.dart';

import 'models/NotesBloc.dart';

class BlocPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<CounterBloc>(create: (_) => CounterBloc(),
      child: BlocProvider<NotesBloc>(create: (_) => NotesBloc(),
          child: GenericPage(this)
      ),
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Bloc";



  @override
  Widget getCounterText(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) => Text('${state.count}', style: new TextStyle(fontSize: 60.0))
    );
  }

  @override
  void decrement(BuildContext context) => context.bloc<CounterBloc>().add(DecrementAction());

  @override
  void increment(BuildContext context) => context.bloc<CounterBloc>().add(IncrementAction());



  @override
  Widget getNotesList(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) => NotesList(state)
    );
  }

  @override
  void addNote(BuildContext context) => context.bloc<NotesBloc>().add(AddNoteAction());

  @override
  void updateInput(BuildContext context, String input) => context.bloc<NotesBloc>().add(UpdateInputAction(input));
}

