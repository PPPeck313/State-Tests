import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_tests/common/widgets/screen/page/page_behavior.dart';

abstract class StatelessObserverScopePage extends HookWidget with ObserverScopeBehavior {
  StatelessObserverScopePage({super.key});

  @override
  Widget build(BuildContext context) => PageStarter(counterBuilder, notesBuilder, useTextEditingController());
}

abstract class StatelessProvidedContextScopePage extends HookWidget with ProvidedContextScopeBehavior {
  StatelessProvidedContextScopePage({super.key});

  @override
  Widget build(BuildContext context) => PageStarter(counterBuilder, notesBuilder, useTextEditingController());
}
