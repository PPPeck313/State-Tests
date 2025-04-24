import 'package:flutter/widgets.dart';
import 'package:state_tests/common/widgets/page/stateful_page.dart';
import 'package:state_tests/states/viewmodel/models/counter_view_model.dart';
import 'package:state_tests/states/viewmodel/models/notes_view_model.dart';

class ViewModelPageState extends StatefulPageState {
  final CounterViewModel counterViewModel;
  final NotesViewModel notesViewModel;

  ViewModelPageState(this.counterViewModel, this.notesViewModel);

  ViewModelPageState.def() : this(CounterViewModel(), NotesViewModel());

  @override
  Widget getCounterWidget(Widget Function(CounterViewModel) widget) => widget(
    CounterViewModel(
      counterViewModel.state,
      () => setState(counterViewModel.decrement),
      () => setState(counterViewModel.increment),
    ),
  );

  @override
  Widget getNotesWidget(Widget Function(NotesViewModel) widget) => widget(
    NotesViewModel(
      notesViewModel.state,
      (input) => setState(() => notesViewModel.updateInput(input)),
      () => setState(notesViewModel.addNote),
    ),
  );
}
