import 'package:flutter/widgets.dart';
import 'package:state_tests/common/extensions/_scope.dart';
import 'package:state_tests/common/widgets/screen/page/stateful_page.dart';
import 'package:state_tests/states/context/default/inherited/models/inherited_widget_view_model.dart';
import 'package:state_tests/states/counter_view_model.dart';
import 'package:state_tests/states/notes_view_model.dart';

class InheritedPageState extends StatefulDefaultContextScopePageState {
  final CounterViewModel counterViewModel;
  final NotesViewModel notesViewModel;

  InheritedPageState(this.counterViewModel, this.notesViewModel);

  InheritedPageState.def() : this(CounterViewModel(), NotesViewModel());

  /*@override
  Widget build(BuildContext context) => InheritedWidgetViewModel(
    counterViewModel,
    child: InheritedWidgetViewModel(notesViewModel, child: super.build(context)),
  );*/

  @override
  Widget getCounterWidget(Widget Function(CounterViewModel) widget, {BuildContext? scope}) =>
      InheritedWidgetViewModelWrapper(
        counterViewModel,
        (context) => InheritedWidgetViewModel.of<CounterViewModel>(context).viewModel.let(
          (it) => widget(CounterViewModel(it.state, () => setState(it.decrement), () => setState(it.increment))),
        ),
      );

  @override
  Widget getNotesWidget(Widget Function(NotesViewModel) widget, {BuildContext? scope}) =>
      InheritedWidgetViewModelWrapper(
        notesViewModel,
        (context) => InheritedWidgetViewModel.of<NotesViewModel>(context).viewModel.let(
          (it) => widget(
            NotesViewModel(it.state, (input) => setState(() => it.updateInput(input)), () => setState(it.addNote)),
          ),
        ),
      );
}
