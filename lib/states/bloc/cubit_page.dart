import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/common/widgets/screen/page/page_behavior.dart';
import 'package:state_tests/common/widgets/screen/page/stateless_page.dart';
import 'package:state_tests/states/counter_view_model.dart';
import 'package:state_tests/states/notes_view_model.dart';
import 'package:state_tests/states/bloc/models/counter_cubit.dart';
import 'package:state_tests/states/bloc/models/notes_cubit.dart';

class CubitPage extends StatelessProvidedScopePage {
  CubitPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext _) => CounterCubit()),
      BlocProvider(create: (BuildContext _) => NotesCubit()),
    ],
    child: PageStarter(counterBuilder, notesBuilder, useTextEditingController()),
  );

  @override
  Widget getCounterWidget(Widget Function(CounterViewModel) widget) => BlocBuilder<CounterCubit, CounterState>(
    builder:
        (context, _) => widget(
          CounterViewModel(
            context.watch<CounterCubit>().state,
            () => context.read<CounterCubit>().decrement(),
            () => context.read<CounterCubit>().increment(),
          ),
        ),
  );

  @override
  Widget getNotesWidget(Widget Function(NotesViewModel) widget) => BlocBuilder<NotesCubit, NotesState>(
    builder:
        (context, _) => widget(
          NotesViewModel(
            context.watch<NotesCubit>().state,
            (input) => context.read<NotesCubit>().updateInput(input),
            () => context.read<NotesCubit>().addNote(),
          ),
        ),
  );
}
