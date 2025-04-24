import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_tests/common/widgets/builder/typed_function.dart';
import 'package:state_tests/common/widgets/counter/counter.dart';
import 'package:state_tests/common/widgets/notes/notes.dart';
import 'package:state_tests/common/widgets/page/page_behavior.dart';

import '../../common/models/counter/counter_event.dart';
import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_event.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/builder/builder_policy.dart';
import 'models/counter_bloc.dart';
import 'models/notes_bloc.dart';

class BlocPage extends HookWidget with PageScopedBehavior {
  @override
  final TextEditingController controller = useTextEditingController();

  BlocPage({super.key});

  @override
  Widget build(BuildContext context) => pageStarter(counterPolicy, notesPolicy, controller);

  @override
  Widget getCounterWidget(Widget Function(ScopedArgs<CounterState>) wFun) => BlocBuilder<CounterBloc, CounterState>(
    builder:
        (context, _) => wFun(
          ScopedArgs(context.watch<CounterBloc>().state, {
            Counter.decrement: Fun0Args<void>(() => context.read<CounterBloc>().add(DecrementEvent())),
            Counter.increment: Fun0Args<void>(() => context.read<CounterBloc>().add(IncrementEvent())),
          }),
        ),
  );

  @override
  Widget getNotesWidget(Widget Function(ScopedArgs<NotesState>) wFun) => BlocBuilder<NotesBloc, NotesState>(
    builder:
        (context, _) => wFun(
          ScopedArgs(context.watch<NotesBloc>().state, {
            Notes.updateInput: Fun1Arg<void, String>((s) => context.read<NotesBloc>().add(UpdateInputEvent(s))),
            Notes.addNote: Fun0Args<void>(() => context.read<NotesBloc>().add(AddNoteEvent())),
          }),
        ),
  );
}
