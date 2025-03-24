import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/models/counter/counter_event.dart';
import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_event.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/counter_bloc.dart';
import 'models/notes_bloc.dart';

class BlocPage extends GenericPageState {
  @override
  CounterBloc counterViewModel;

  @override
  NotesBloc notesViewModel;

  BlocPage() : counterViewModel = CounterBloc(), notesViewModel = NotesBloc();

  // @override
  // Widget build(BuildContext context) => MultiBlocProvider(
  //   providers: [
  //     BlocProvider(create: (BuildContext _) => CounterBloc()),
  //     BlocProvider(create: (BuildContext _) => NotesBloc()),
  //   ],
  //   child: super.build(context),
  // );

  @override
  Widget? getCounterWidget(Widget child) => BlocBuilder<CounterBloc, CounterState>(builder: (_, _) => child);

  @override
  CounterState getCounterState(BuildContext context) => context.watch<CounterBloc>().state; // counterViewModel.state

  @override
  void decrement(BuildContext context) => context.read()<CounterBloc>().add(DecrementEvent()); // counterViewModel.add

  @override
  void increment(BuildContext context) => context.read()<CounterBloc>().add(IncrementEvent()); // counterViewModel.add

  @override
  Widget? getNotesWidget(Widget child) => BlocBuilder<NotesBloc, NotesState>(builder: (_, _) => child);

  @override
  NotesState getNotesState(BuildContext context) => context.watch<NotesBloc>().state; // notesViewModel.state

  @override
  void updateInput(BuildContext context, String input) => context.read<NotesBloc>().add(UpdateInputEvent(input)); // notesViewMode.add

  @override
  void addNote(BuildContext context) => context.read<NotesBloc>().add(AddNoteEvent()); // notesViewModel.add
}
