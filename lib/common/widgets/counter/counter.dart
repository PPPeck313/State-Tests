import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/models/counter/base_counter_view_model.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/common/widgets/builder/builder_policy.dart';
import 'package:state_tests/common/widgets/builder/typed_function.dart';

import 'counter_button.dart';

part 'counter.g.dart';

class Counter extends StatelessWidget {
  static const String decrement = 'decrement';
  static const String increment = 'increment';

  final BuilderPolicy<CounterState, BaseCounterViewModel> _policy;

  const Counter(this._policy, {super.key});

  @override
  Widget build(BuildContext context) => switch (_policy) {
    Fitted<CounterState, BaseCounterViewModel> f => counterFrame(
      CounterButton.negative(Fun0Args<void>(f.viewModel.decrement)),
      f.fittedObserver((state) => counterText(state.count)),
      CounterButton.positive(Fun0Args<void>(f.viewModel.increment)),
    ),
    Scoped<CounterState, BaseCounterViewModel> s => s.scopedObserver(
      (args) => counterFrame(
        CounterButton.negative(args.functions[decrement] as Fun0Args<void>),
        counterText(args.state.count),
        CounterButton.positive(args.functions[increment] as Fun0Args<void>),
      ),
    ),
  };
}

@swidget
Widget counterFrame(CounterButton negativeButton, Widget text, CounterButton positiveButton) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [negativeButton, text, positiveButton]);

@swidget
Widget counterText(int count) => Text('$count', style: TextStyle(fontSize: 60.0));
