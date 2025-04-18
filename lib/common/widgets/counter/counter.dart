import 'package:flutter/material.dart';

import '../../models/counter/counter_state.dart';
import 'counter_button.dart';

class Counter extends StatelessWidget {
  final Widget Function(Widget Function(CounterState) childFunction) getStateWidgetFunction;

  final void Function(BuildContext) decrementFunction;
  final void Function(BuildContext) incrementFunction;

  const Counter(this.getStateWidgetFunction, this.decrementFunction, this.incrementFunction, {super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      CounterButton(Icons.remove, decrementFunction),
      getStateWidgetFunction((state) => Text('${state.count}', style: TextStyle(fontSize: 60.0))),
      CounterButton(Icons.add, incrementFunction),
    ],
  );
}

class CounterText extends StatelessWidget {
  final int count;

  const CounterText(this.count, {super.key});

  @override
  Widget build(BuildContext context) => Text('$count', style: TextStyle(fontSize: 60.0));
}
