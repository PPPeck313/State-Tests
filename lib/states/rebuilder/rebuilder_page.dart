import 'package:flutter/material.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/counter_rebuilder.dart';
import 'models/notes_rebuilder.dart';

class RebuilderPage extends GenericPageState {
  @override
  CounterRebuilder counterViewModel;

  @override
  NotesRebuilder notesViewModel;

  RebuilderPage(this.counterViewModel, this.notesViewModel);

  RebuilderPage.def() : this(CounterRebuilder(), NotesRebuilder());

  // Local/Scoped state = inherited widget
  @override
  CounterState getCounterState(BuildContext context) => counterViewModel.injectedState.of(context);

  @override
  Widget getCounterStateWidget(Widget counter) =>
      counterViewModel.injectedState.inherited(builder: (_) => counter, stateOverride: () => counterViewModel.state);

  @override
  NotesState getNotesState(BuildContext context) => notesViewModel.injectedState.of(context);

  @override
  Widget getNotesStateWidget(Widget notes) =>
      notesViewModel.injectedState.inherited(builder: (_) => notes, stateOverride: () => notesViewModel.state);
}
