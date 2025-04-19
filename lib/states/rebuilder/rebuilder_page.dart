import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/listeners/on_reactive.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/page/stateless_page.dart';
import 'models/counter_rebuilder.dart';
import 'models/notes_rebuilder.dart';

class RebuilderPage extends StatelessPage {
  @override
  CounterRebuilder counterViewModel;

  @override
  NotesRebuilder notesViewModel;

  RebuilderPage(this.counterViewModel, this.notesViewModel);

  RebuilderPage.def() : this(CounterRebuilder(), NotesRebuilder());

  // Local/Scoped state = inherited widget
  @override
  Widget getCounterWidget(Widget Function(CounterState) counter) => OnReactive(() => counter(counterViewModel.state));

  @override
  Widget getNotesWidget(Widget Function(NotesState) notes) => OnReactive(() => notes(notesViewModel.state));
}
