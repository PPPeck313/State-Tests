import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/models/counter/base_counter_view_model.dart';

import '../builder/builder_type.dart';
import 'counter_button.dart';

part 'counter.g.dart';

class Counter extends StatelessWidget {
  final BuilderType<BaseCounterViewModel> _builder;

  const Counter(this._builder, {super.key});

  @override
  Widget build(BuildContext context) => switch (_builder) {
    Fitted<BaseCounterViewModel> f => CounterFrame(f.viewModel, f.obs((_) => CounterText(f.viewModel.state.count))),
    Scoped<BaseCounterViewModel> s => s.obs((vM) => CounterFrame(vM, CounterText(vM.state.count))),
  };
}

@swidget
Widget counterFrame(BaseCounterViewModel viewModel, Widget counterText) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [CounterButton.negative(viewModel.decrement), counterText, CounterButton.positive(viewModel.increment)],
);

@swidget
Widget counterText(int count) => Text('$count', style: TextStyle(fontSize: 60.0));
