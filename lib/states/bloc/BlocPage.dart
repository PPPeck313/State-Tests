import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_tests/common/models/counter/CounterEvent.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesEvent.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/states/bloc/models/CounterBloc.dart';

import 'models/NotesBloc.dart';
import 'models/NotesCubit.dart';

class BlocPage extends GenericPageState {
  //value vs create in order to reuse
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => NotesCubit()),
          BlocProvider(create: (BuildContext context) => NotesCubit()),
        ],
        child: GenericPage(this),
      );

  @override
  String getTag() => 'Bloc';

  @override
  CounterState getCounterState(BuildContext context) => context.watch()<CounterBloc>().state;

  @override
  void decrement(BuildContext context) => context.read()<CounterBloc>().add(DecrementEvent());

  @override
  void increment(BuildContext context) => context.read()<CounterBloc>().add(IncrementEvent());

  @override
  NotesState getNotesState(BuildContext context) => context.read<NotesBloc>().state;

  @override
  void addNote(BuildContext context) => context.watch<NotesBloc>().add(AddNoteEvent());

  @override
  void updateInput(BuildContext context, String input) => context.watch<NotesBloc>().add(UpdateInputEvent(input));
}
