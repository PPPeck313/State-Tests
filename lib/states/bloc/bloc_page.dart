import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:state_tests/common/models/counter/counter_event.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/common/models/note/notes_event.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/common/widgets/screen/page/page_behavior.dart';
import 'package:state_tests/common/widgets/screen/page/stateless_page.dart';
import 'package:state_tests/states/counter_view_model.dart';
import 'package:state_tests/states/notes_view_model.dart';
import 'package:state_tests/states/bloc/models/counter_bloc.dart';
import 'package:state_tests/states/bloc/models/notes_bloc.dart';

class BlocPage extends StatelessProvidedScopePage {
  BlocPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext _) => CounterBloc()),
      BlocProvider(create: (BuildContext _) => NotesBloc()),
    ],
    child: PageStarter(counterBuilder, notesBuilder, useTextEditingController()),
  );

  @override
  Widget getCounterWidget(Widget Function(CounterViewModel) widget) => BlocBuilder<CounterBloc, CounterState>(
    builder:
        (context, _) => widget(
          CounterViewModel(
            context.watch<CounterBloc>().state,
            () => context.read<CounterBloc>().add(DecrementEvent()),
            () => context.read<CounterBloc>().add(IncrementEvent()),
          ),
        ),
  );

  @override
  Widget getNotesWidget(Widget Function(NotesViewModel) widget) => BlocBuilder<NotesBloc, NotesState>(
    builder:
        (context, _) => widget(
          NotesViewModel(
            context.watch<NotesBloc>().state,
            (input) => context.read<NotesBloc>().add(UpdateInputEvent(input)),
            () => context.read<NotesBloc>().add(AddNoteEvent()),
          ),
        ),
  );
}
