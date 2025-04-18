import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final void Function(BuildContext) setStateFunction;

  const CounterButton(this.icon, this.setStateFunction, {super.key});

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: () => setStateFunction(context),
    backgroundColor: Colors.white,
    child: Icon(icon, color: Colors.black),
  );
}
