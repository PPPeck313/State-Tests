import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_tests/common/widgets/builder/typed_function.dart';
import 'package:state_tests/common/widgets/counter/counter.dart';
import 'package:state_tests/states/river_pod/models/notes_notifier.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/builder/builder_policy.dart';
import '../../common/widgets/notes/notes.dart';
import '../../common/widgets/page/page_behavior.dart';
import 'models/counter_notifier.dart';

class RiverPodPage extends HookConsumerWidget with PageScopedBehavior {
  @override
  final TextEditingController controller = useTextEditingController();

  RiverPodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => pageStarter(counterPolicy, notesPolicy, controller);

  @override
  Widget getCounterWidget(Widget Function(ScopedArgs<CounterState>) wFun) => Consumer(
    builder:
        (context, ref, _) => wFun(
          ScopedArgs(ref.watch(counterNotifierProvider), {
            Counter.decrement: Fun0Args<void>(ref.read(counterNotifierProvider.notifier).decrement),
            Counter.increment: Fun0Args<void>(ref.read(counterNotifierProvider.notifier).increment),
          }),
        ),
  );

  @override
  Widget getNotesWidget(Widget Function(ScopedArgs<NotesState>) wFun) => Consumer(
    builder:
        (context, ref, _) => wFun(
          ScopedArgs(ref.watch(notesNotifierProvider), {
            Notes.updateInput: Fun1Arg<void, String>((s) => ref.read(notesNotifierProvider.notifier).updateInput(s)),
            Notes.addNote: Fun0Args<void>(ref.read(notesNotifierProvider.notifier).addNote),
          }),
        ),
  );
}
