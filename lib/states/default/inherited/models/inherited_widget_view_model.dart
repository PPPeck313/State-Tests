import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/reactive_state.dart';

class InheritedWidgetViewModel<VM extends ReactiveViewModel> extends InheritedWidget {
  final VM viewModel;

  const InheritedWidgetViewModel(this.viewModel, {super.key, required super.child});

  static InheritedWidgetViewModel<VM> of<VM extends ReactiveViewModel>(BuildContext? context) {
    final result = context?.dependOnInheritedWidgetOfExactType<InheritedWidgetViewModel<VM>>();
    assert(result != null, 'No CounterViewModel found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedWidgetViewModel oldWidget) => viewModel.state != oldWidget.viewModel.state;
}
