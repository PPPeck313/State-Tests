import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/page/page_behavior.dart';
import '../../common/widgets/page/stateless_page.dart';
import 'models/counter_notifier.dart';
import 'models/notes_notifier.dart';

class RiverPodPage extends HookConsumer with PageBehavior {
  final TextEditingController controller = useTextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) => buildPage(context, controller);

  @override
  Widget getCounterWidget(Widget Function(CounterState) counter) =>
      counter(context.read<SubjectBloc>().watch(counterNotifierProvider));

  @override
  void increment(BuildContext context) => ref.read(counterNotifierProvider).increment();

  @override
  void decrement(BuildContext context) => counterViewModel?.decrement();

  @override
  Widget getNotesWidget(Widget Function(NotesState) notes) => notes(ref.watch(notesNotifierProvider));
}
