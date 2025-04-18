import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_tests/states/river_pod/models/counter_provider.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/generic_page.dart';
import 'models/notes_provider.dart';

class RiverPodPage extends GenericPageState {
  @override
  final CounterProvider counterViewModel;

  @override
  final NotesProvider notesViewModel;

  RiverPodPage(this.counterViewModel, this.notesViewModel);

  late WidgetRef counterRef;
  late WidgetRef notesRef;

  RiverPodPage.def() : this(CounterProvider(), NotesProvider());

  @override
  CounterState getCounterState(BuildContext context) => counterRef.watch(counterViewModel.provider);

  @override
  Widget getCounterStateWidget(Widget counter) => Consumer(
    builder: (context, ref, child) {
      counterRef = ref;
      return counter;
    },
  );

  @override
  NotesState getNotesState(BuildContext context) => notesRef.watch(notesViewModel.provider);

  @override
  Widget getNotesStateWidget(Widget notes) => Consumer(
    builder: (context, ref, child) {
      notesRef = ref;
      return notes;
    },
  );
}
