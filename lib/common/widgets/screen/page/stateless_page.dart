import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:state_tests/common/widgets/screen/page/page_behavior.dart';

abstract class StatelessViewModelScopePage extends HookWidget with ViewModelScopeBehavior {
  StatelessViewModelScopePage({super.key});

  @override
  Widget build(BuildContext context) => PageStarter(counterBuilder, notesBuilder, useTextEditingController());
}

abstract class StatelessProvidedScopePage extends HookWidget with ProvidedContextScopeBehavior {
  StatelessProvidedScopePage({super.key});

  @override
  Widget build(BuildContext context) => PageStarter(counterBuilder, notesBuilder, useTextEditingController());
}
