import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/widgets/debug/widget_transformer.dart';
import 'common/widgets/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(child: kDebugMode ? WidgetTransformer(transform: paddingToDebug).run(MyApp()) : MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(home: HomeScreen());
}
