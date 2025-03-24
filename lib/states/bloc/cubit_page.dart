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
  @override
  CounterCubit counterViewModel;

  @override
  NotesCubit notesViewModel;

  CubitPage() : counterViewModel = CounterCubit(), notesViewModel = NotesCubit();

  // @override
  // Widget build(BuildContext context) => MultiBlocProvider(
  //   providers: [
  //     BlocProvider(create: (BuildContext _) => CounterCubit()),
  //     BlocProvider(create: (BuildContext _) => NotesCubit()),
  //   ],
  //   child: super.build(context),
  // );

  @override
  Widget? getCounterWidget(Widget child) => BlocBuilder<CounterCubit, CounterState>(builder: (_, _) => child);

  @override
  CounterState getCounterState(BuildContext context) => context.watch<CounterCubit>().state; // counterViewModel.state

  @override
  void decrement(BuildContext context) => context.read<CounterCubit>().decrement(); // counterViewModel

  @override
  void increment(BuildContext context) => context.read<CounterCubit>().increment(); // counterViewModel

  @override
  Widget? getNotesWidget(Widget child) => BlocBuilder<NotesBloc, NotesState>(builder: (_, _) => child);

  @override
  NotesState getNotesState(BuildContext context) => context.watch<NotesBloc>().state; // notesViewModel.state

  @override
  void updateInput(BuildContext context, String input) => context.read<NotesCubit>().updateInput(input); // notesViewModel

  @override
  void addNote(BuildContext context) => context.read<NotesCubit>().addNote(); // notesViewModel
}
