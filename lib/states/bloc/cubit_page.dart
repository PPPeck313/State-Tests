import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_tests/common/widgets/notes/notes.dart';
import 'package:state_tests/states/bloc/models/counter_cubit.dart';
import 'package:state_tests/states/bloc/models/notes_cubit.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/builder/builder_policy.dart';
import '../../common/widgets/builder/typed_function.dart';
import '../../common/widgets/counter/counter.dart';
import '../../common/widgets/page/page_behavior.dart';

class CubitPage extends HookWidget with PageScopedBehavior {
  CubitPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext _) => CounterCubit()),
      BlocProvider(create: (BuildContext _) => NotesCubit()),
    ],
    child: pageStarter(counterPolicy, notesPolicy, useTextEditingController()),
  );

  @override
  Widget getCounterWidget(Widget Function(ScopedArgs<CounterState>) wFun) => BlocBuilder<CounterCubit, CounterState>(
    builder:
        (context, _) => wFun(
          ScopedArgs(context.watch<CounterCubit>().state, {
            Counter.decrement: Fun0Args<void>(() => context.read<CounterCubit>().decrement()),
            Counter.increment: Fun0Args<void>(() => context.read<CounterCubit>().increment()),
          }),
        ),
  );

  @override
  Widget getNotesWidget(Widget Function(ScopedArgs<NotesState>) wFun) => BlocBuilder<NotesCubit, NotesState>(
    builder:
        (context, _) => wFun(
          ScopedArgs(context.watch<NotesCubit>().state, {
            Notes.updateInput: Fun1Arg<void, String>((s) => context.read<NotesCubit>().updateInput(s)),
            Notes.addNote: Fun0Args<void>(() => context.read<NotesCubit>().addNote()),
          }),
        ),
  );
}
