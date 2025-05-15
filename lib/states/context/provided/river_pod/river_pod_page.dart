import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_tests/common/widgets/screen/page/page_behavior.dart';
import 'package:state_tests/states/context/provided/river_pod/models/counter_notifier.dart';
import 'package:state_tests/states/context/provided/river_pod/models/notes_notifier.dart';
import 'package:state_tests/states/counter_view_model.dart';
import 'package:state_tests/states/notes_view_model.dart';

class RiverPodPage extends HookConsumerWidget with ProvidedContextScopeBehavior {
  RiverPodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      PageStarter(counterBuilder, notesBuilder, useTextEditingController());

  @override
  Widget getCounterWidget(Widget Function(CounterViewModel) widget) => Consumer(
    builder:
        (context, ref, _) => widget(
          CounterViewModel(
            ref.watch(counterNotifierProvider),
            ref.read(counterNotifierProvider.notifier).decrement,
            ref.read(counterNotifierProvider.notifier).increment,
          ),
        ),
  );

  @override
  Widget getNotesWidget(Widget Function(NotesViewModel) widget) => Consumer(
    builder:
        (context, ref, _) => widget(
          NotesViewModel(
            ref.watch(notesNotifierProvider),
            ref.read(notesNotifierProvider.notifier).updateInput,
            ref.read(notesNotifierProvider.notifier).addNote,
          ),
        ),
  );
}
