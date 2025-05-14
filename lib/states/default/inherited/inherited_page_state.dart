import 'package:flutter/widgets.dart';
import 'package:state_tests/common/extensions/_scope.dart';

import '../../../common/widgets/screen/page/stateful_page.dart';
import '../../counter_view_model.dart';
import '../../notes_view_model.dart';
import 'models/inherited_widget_view_model.dart';

class InheritedPageState extends StatefulDefaultScopePageState {
  final CounterViewModel counterViewModel;
  final NotesViewModel notesViewModel;

  InheritedPageState(this.counterViewModel, this.notesViewModel);

  InheritedPageState.def() : this(CounterViewModel(), NotesViewModel());

  @override
  Widget build(BuildContext context) => InheritedWidgetViewModel(
    counterViewModel,
    child: InheritedWidgetViewModel(notesViewModel, child: super.build(context)),
  );

  @override
  Widget getCounterWidget(Widget Function(CounterViewModel) widget, {BuildContext? scope}) =>
      InheritedWidgetViewModel.of<CounterViewModel>(scope).viewModel.let(
        (it) => widget(CounterViewModel(it.state, () => setState(it.decrement), () => setState(it.increment))),
      );

  @override
  Widget getNotesWidget(Widget Function(NotesViewModel) widget, {BuildContext? scope}) =>
      InheritedWidgetViewModel.of<NotesViewModel>(scope).viewModel.let(
        (it) => widget(
          NotesViewModel(it.state, (input) => setState(() => it.updateInput(input)), () => setState(it.addNote)),
        ),
      );
}
