import 'package:flutter/material.dart';
import 'package:state_tests/common/extensions/_scope.dart';

import '../../common/widgets/screen/page/stateful_page.dart';
import '../counter_view_model.dart';
import '../notes_view_model.dart';

class SetStatePageState extends StatefulProvidedScopePageState {
  final CounterViewModel counterViewModel;
  final NotesViewModel notesViewModel;

  SetStatePageState(this.counterViewModel, this.notesViewModel);

  SetStatePageState.def() : this(CounterViewModel(), NotesViewModel());

  @override
  Widget getCounterWidget(Widget Function(CounterViewModel) widget) => widget(
    counterViewModel.let(
      (it) => CounterViewModel(it.state, () => setState(it.decrement), () => setState(it.increment)),
    ),
  );

  @override
  Widget getNotesWidget(Widget Function(NotesViewModel) widget) => widget(
    notesViewModel.let(
      (it) => NotesViewModel(it.state, (input) => setState(() => it.updateInput(input)), () => setState(it.addNote)),
    ),
  );
}
