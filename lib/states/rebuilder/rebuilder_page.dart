import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/listeners/on_reactive.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/page/stateless_page.dart';
import 'models/counter_rebuilder.dart';
import 'models/notes_rebuilder.dart';

class RebuilderPage extends StatelessPage {
  @override
  final CounterRebuilder counterViewModel;

  @override
  final NotesRebuilder notesViewModel;

  RebuilderPage(this.counterViewModel, this.notesViewModel, {super.key});

  RebuilderPage.def({Key? key}) : this(CounterRebuilder(), NotesRebuilder(), key: key);

  // Local/Scoped state = inherited widget
  @override
  Widget getCounterWidget(Widget Function(CounterState) wFun) => OnReactive(() => wFun(counterViewModel.state));

  @override
  Widget getNotesWidget(Widget Function(NotesState) wFun) => OnReactive(() => wFun(notesViewModel.state));
}
