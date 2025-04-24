import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_tests/common/widgets/page/page_behavior.dart';

final class StatefulPage extends StatefulHookWidget {
  final StatefulPageState pageState;

  const StatefulPage(this.pageState, {super.key});

  @override
  State<StatefulHookWidget> createState() => pageState;
}

abstract class StatefulPageState extends State<StatefulHookWidget> with PageScopedBehavior {
  @override
  Widget build(BuildContext context) => pageStarter(counterBuilder, notesBuilder, useTextEditingController());
}
