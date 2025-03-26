import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_tests/states/bloc/models/counter_cubit.dart';
import 'package:state_tests/states/bloc/models/notes_cubit.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/notes_bloc.dart';

class CubitPage extends GenericPageState {
  // @override
  // Widget build(BuildContext context) => MultiBlocProvider(
  //   providers: [
  //     BlocProvider(create: (BuildContext _) => CounterCubit()),
  //     BlocProvider(create: (BuildContext _) => NotesCubit()),
  //   ],
  //   child: super.build(context),
  // );

  @override
  Widget getCounterStateWidget(Widget counter) => BlocBuilder<CounterCubit, CounterState>(builder: (_, _) => counter);

  @override
  CounterState getCounterState(BuildContext context) => context.watch<CounterCubit>().state;

  @override
  void decrement(BuildContext context) => context.read<CounterCubit>().decrement();

  @override
  void increment(BuildContext context) => context.read<CounterCubit>().increment();

  @override
  Widget getNotesStateWidget(Widget notes) => BlocBuilder<NotesBloc, NotesState>(builder: (_, _) => notes);

  @override
  NotesState getNotesState(BuildContext context) => context.watch<NotesBloc>().state;

  @override
  void updateInput(BuildContext context, String input) => context.read<NotesCubit>().updateInput(input);

  @override
  void addNote(BuildContext context) => context.read<NotesCubit>().addNote();
}
