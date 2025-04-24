import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final void Function() setState;

  const CounterButton(this.icon, this.setState, {super.key});
  const CounterButton.negative(this.setState, {super.key}) : icon = Icons.remove;
  const CounterButton.positive(this.setState, {super.key}) : icon = Icons.add;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: () => setState.call(),
    backgroundColor: Colors.white,
    child: Icon(icon, color: Colors.black),
  );
}
