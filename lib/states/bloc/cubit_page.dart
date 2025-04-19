import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_tests/states/bloc/models/counter_cubit.dart';
import 'package:state_tests/states/bloc/models/notes_cubit.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/page/stateless_page.dart';

class CubitPage extends StatelessPage {
  @override
  Widget buildPage(BuildContext context, TextEditingController controller) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext _) => CounterCubit()),
      BlocProvider(create: (BuildContext _) => NotesCubit()),
    ],
    child: super.buildPage(context, controller),
  );

  @override
  Widget getCounterWidget(Widget Function(CounterState) counter) =>
      BlocBuilder<CounterCubit, CounterState>(builder: (context, _) => counter(context.watch<CounterCubit>().state));

  @override
  void decrement(BuildContext context) => context.read<CounterCubit>().decrement();

  @override
  void increment(BuildContext context) => context.read<CounterCubit>().increment();

  @override
  Widget getNotesWidget(Widget Function(NotesState) notes) =>
      BlocBuilder<NotesCubit, NotesState>(builder: (context, _) => notes(context.watch<NotesCubit>().state));

  @override
  void updateInput(BuildContext context, String input) => context.read<NotesCubit>().updateInput(input);

  @override
  void addNote(BuildContext context) => context.read<NotesCubit>().addNote();
}
