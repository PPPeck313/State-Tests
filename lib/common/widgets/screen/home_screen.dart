import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/extensions/_build_context.dart';
import 'package:state_tests/common/extensions/_string.dart';
import 'package:state_tests/common/widgets/builder/state_type.dart';
import 'package:state_tests/common/widgets/counter/counter.dart';
import 'package:state_tests/common/widgets/counter/counter_button.dart';
import 'package:state_tests/common/widgets/debug/debug_manager.dart';
import 'package:state_tests/common/widgets/debug/debug_padding.dart';
import 'package:state_tests/common/widgets/notes/notes.dart';
import 'package:state_tests/common/widgets/notes/notes_list.dart';
import 'package:state_tests/common/widgets/screen/home_drawer.dart';
import 'package:state_tests/states/bloc/bloc_observer.dart';

part 'home_screen.g.dart';

class HomeScreen extends StatefulWidget {
  final DebugManager debugManager;

  const HomeScreen(this.debugManager, {super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DebugManager debugManager;

  String? _widgetTree;
  StateType _currentStateType = StateType.setState;

  @override
  void initState() {
    super.initState();
    debugManager = widget.debugManager;
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
      }, () => setState(() => debugManager.flipState())),
      theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}

@swidget
Widget homeScaffold(
  List<StateType> stateTypes,
  GlobalKey<ScaffoldState> scaffoldKey,
  String? widgetTree,
  StateType stateType,
  Function(StateType) setStateType,
  Function setDebugState,
) => DefaultTabController(
  length: stateTypes.length,
  child: Scaffold(
    key: scaffoldKey,
    appBar: AppBar(title: Text(stateType.name.toCapitalized)),
    body: SingleChildScrollView(
      child: MyPadding(padding: const EdgeInsets.all(8.0), child: HomeContent(widgetTree, stateType.page)),
    ),
    drawer: HomeDrawer(stateTypes, setStateType),
    floatingActionButton:
        kDebugMode
            ? FloatingActionButton(onPressed: () => setDebugState(), child: Icon(Icons.bug_report))
            : SizedBox.shrink(),
  ),
);

@swidget
Widget homeContent(String? widgetTree, Widget stateTypePage) => Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    stateTypePage,
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
          ? Html(data: widgetTree, style: {'b': Style(fontWeight: FontWeight.bold), '*': Style(fontSize: FontSize(11))})
          : SizedBox.shrink(),
    ],
  ),
);

String printHomeTree(BuildContext context, StateType stateType) => context.print(
  matcher: (type) => type == stateType.page.runtimeType,
  printOptions: PrintOptions(
    detailedMode: false,
    filterMatcher: (type) => NodeMatchers.stateMatcher(type) || [MyPadding].contains(type),
    truncateMatcher:
        (type) => [MyPadding, CounterButton, CounterText, AddNoteButton, NoteEditText, NotesList].contains(type),
  ),
);
