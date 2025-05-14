import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_tests/common/widgets/debug/debug_manager.dart';
import 'package:state_tests/common/widgets/screen/home_screen.dart';

void main() => runApp(ProviderScope(child: MyApp(DebugManager())));

class MyApp extends StatelessWidget {
  final DebugManager debugManager;

  const MyApp(this.debugManager, {super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(home: HomeScreen(debugManager));
}
