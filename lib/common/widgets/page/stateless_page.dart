import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'page_behavior.dart';

abstract class StatelessPage extends HookWidget with PageViewModelFittedBehavior {
  StatelessPage({super.key});

  @override
  final TextEditingController controller = useTextEditingController();

  @override
  Widget build(BuildContext context) => pageStarter(counterPolicy, notesPolicy, controller);
}
