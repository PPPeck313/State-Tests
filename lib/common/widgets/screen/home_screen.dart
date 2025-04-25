import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/extensions/_build_context.dart';
import 'package:state_tests/common/extensions/_string.dart';
import 'package:state_tests/common/widgets/counter/counter.dart';
import 'package:state_tests/common/widgets/counter/counter_button.dart';
import 'package:state_tests/common/widgets/notes/notes.dart';
import 'package:state_tests/common/widgets/notes/notes_list.dart';
import 'package:state_tests/common/widgets/screen/home_drawer.dart';

import '../../../states/bloc/bloc_observer.dart';
import '../builder/state_type.dart';
import '../debug/debug_padding.dart';

part 'home_screen.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StateType _currentStateType = StateType.bloc;
  String? _widgetTree;

  @override
  void initState() {
    super.initState();
    Bloc.observer = SimpleBlocObserver();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_widgetTree == null) setState(() => _widgetTree = printHomeTree(context, _currentStateType));
    });

    return MaterialApp(
      home: HomeScaffold(StateType.values, _scaffoldKey, _widgetTree, _currentStateType, (stateType) {
        _scaffoldKey.currentState?.openEndDrawer();
        setState(() {
          _currentStateType = stateType;
          _widgetTree = null;
        });
      }),
      theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}

String printHomeTree(BuildContext context, StateType stateType) => context.print(
  matcher: (type) => type == stateType.page.runtimeType,
  printOptions: PrintOptions(
    detailedMode: false,
    filterMatcher: (type) => NodeMatchers.stateMatcher(type) || [MyPadding].contains(type),
    truncateMatcher:
        (type) => [MyPadding, CounterButton, CounterText, AddNoteButton, NoteEditText, NotesList].contains(type),
  ),
);

@swidget
Widget homeScaffold(
  List<StateType> stateTypes,
  GlobalKey<ScaffoldState> scaffoldKey,
  String? widgetTree,
  StateType currentStateType,
  Function(StateType) setState,
) => DefaultTabController(
  length: stateTypes.length,
  child: Scaffold(
    key: scaffoldKey,
    appBar: AppBar(title: Text(currentStateType.name.toCapitalized)),
    body: SingleChildScrollView(
      child: MyPadding(padding: const EdgeInsets.all(8.0), child: HomeContent(widgetTree, currentStateType)),
    ),
    drawer: HomeDrawer(stateTypes, setState),
  ),
);

@swidget
Widget homeContent(String? widgetTree, StateType currentStateType) => Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    currentStateType.page,
    MyPadding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Divider()),
    WidgetTreePrint(widgetTree),
  ],
);

@swidget
Widget widgetTreePrint(String? widgetTree) => MyPadding(
  padding: const EdgeInsets.symmetric(vertical: 16.0),
  child: Row(
    children: [
      widgetTree != null
          ? Html(data: widgetTree, style: {"b": Style(fontWeight: FontWeight.bold), "*": Style(fontSize: FontSize(11))})
          : SizedBox.shrink(),
    ],
  ),
);
