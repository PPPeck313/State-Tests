import 'package:flutter/material.dart';

import '../counter_state.dart';
import 'counter_button.dart';

class Counter extends StatelessWidget {
  final Widget Function(Widget) getStateWidgetFunction;
  final CounterState Function(BuildContext) getStateFunction;

  final void Function(BuildContext) decrementFunction;
  final void Function(BuildContext) incrementFunction;

  const Counter(
    this.getStateWidgetFunction,
    this.getStateFunction,
    this.decrementFunction,
    this.incrementFunction, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      CounterButton(Icons.add, decrementFunction),
      getStateWidgetFunction(Text('${getStateFunction(context).count}', style: TextStyle(fontSize: 60.0))),
      CounterButton(Icons.remove, incrementFunction),
    ],
  );
}
