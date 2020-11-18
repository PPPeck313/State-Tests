import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/CounterCubit.dart';
import 'models/NotesCubit.dart';

class CubitPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  //value vs create in order to reuse
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>.value(value: CounterCubit(),
      child: BlocProvider<NotesCubit>.value(value: NotesCubit(),
        child: GenericPage(this)
      ),
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Cubit";



  @override
  Widget getCounterText(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) => Text('${state.count}', style: new TextStyle(fontSize: 60.0))
    );
  }

  @override
  void decrement(BuildContext context) => context.bloc<CounterCubit>().decrement();

  @override
  void increment(BuildContext context) => context.bloc<CounterCubit>().increment();



  @override
  Widget getNotesList(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) => NotesList(state)
    );
  }

  @override
  void addNote(BuildContext context) => context.bloc<NotesCubit>().addNote();

  @override
  void updateInput(BuildContext context, String input) => context.bloc<NotesCubit>().updateInput(input);
}