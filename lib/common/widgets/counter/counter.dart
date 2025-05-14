import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/models/counter/base_counter_view_model.dart';

import 'package:state_tests/common/widgets/builder/builder_type.dart';
import 'package:state_tests/common/widgets/counter/counter_button.dart';

part 'counter.g.dart';

class Counter extends StatelessWidget {
  final BuilderType<BaseCounterViewModel> _builder;

  const Counter(this._builder, {super.key});

  @override
  Widget build(BuildContext context) => switch (_builder) {
    ViewModelScope<BaseCounterViewModel> scope => CounterFrame(
      scope.viewModel,
      scope.obs((_) => CounterText(scope.viewModel.state.count)),
    ),
    ProvidedContextScope<BaseCounterViewModel> scope => scope.obs(
      (viewModel) => CounterFrame(viewModel, CounterText(viewModel.state.count)),
    ),
    DefaultContextScope<BaseCounterViewModel> scope => scope.obs(
      scope: context,
      (viewModel) => CounterFrame(viewModel, CounterText(viewModel.state.count)),
    ),
  };
}

@swidget
Widget counterFrame(BaseCounterViewModel viewModel, Widget counterText) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [CounterButton.negative(viewModel.decrement), counterText, CounterButton.positive(viewModel.increment)],
);

@swidget
Widget counterText(int count) => Text('$count', style: TextStyle(fontSize: 60.0));
