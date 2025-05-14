import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_tests/common/widgets/screen/page/page_behavior.dart';

final class StatefulPage extends StatefulHookWidget {
  final State<StatefulHookWidget> pageState;

  const StatefulPage(this.pageState, {super.key});

  @override
  State<StatefulHookWidget> createState() => pageState;
}

abstract class StatefulProvidedScopePageState extends State<StatefulHookWidget> with ProvidedContextScopeBehavior {
  @override
  Widget build(BuildContext context) => PageStarter(counterBuilder, notesBuilder, useTextEditingController());
}

abstract class StatefulDefaultScopePageState extends State<StatefulHookWidget> with DefaultContextScopeBehavior {
  @override
  Widget build(BuildContext context) => PageStarter(counterBuilder, notesBuilder, useTextEditingController());
}
