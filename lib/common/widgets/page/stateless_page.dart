import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'page_behavior.dart';

abstract class StatelessViewModelFittedPage extends HookWidget with PageViewModelFittedBehavior {
  StatelessViewModelFittedPage({super.key});

  @override
  Widget build(BuildContext context) => pageStarter(counterBuilder, notesBuilder, useTextEditingController());
}

abstract class StatelessScopedPage extends HookWidget with PageScopedBehavior {
  StatelessScopedPage({super.key});

  @override
  Widget build(BuildContext context) => pageStarter(counterBuilder, notesBuilder, useTextEditingController());
}
