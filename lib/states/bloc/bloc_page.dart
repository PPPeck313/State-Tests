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
  // @override
  // Widget build(BuildContext context) => MultiBlocProvider(
  //   providers: [
  //     BlocProvider(create: (BuildContext _) => CounterBloc()),
  //     BlocProvider(create: (BuildContext _) => NotesBloc()),
  //   ],
  //   child: super.build(context),
  // );

  @override
  Widget getCounterStateWidget(Widget counter) => BlocBuilder<CounterBloc, CounterState>(builder: (_, _) => counter);

  @override
  CounterState getCounterState(BuildContext context) => context.watch<CounterBloc>().state;

  @override
  void decrement(BuildContext context) => context.read()<CounterBloc>().add(DecrementEvent());

  @override
  void increment(BuildContext context) => context.read()<CounterBloc>().add(IncrementEvent());

  @override
  Widget getNotesStateWidget(Widget notes) => BlocBuilder<NotesBloc, NotesState>(builder: (_, _) => notes);

  @override
  NotesState getNotesState(BuildContext context) => context.watch<NotesBloc>().state;

  @override
  void updateInput(BuildContext context, String input) => context.read<NotesBloc>().add(UpdateInputEvent(input));

  @override
  void addNote(BuildContext context) => context.read<NotesBloc>().add(AddNoteEvent());
}
