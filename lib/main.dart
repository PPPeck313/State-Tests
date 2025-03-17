import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:state_tests/states/bloc/models/CounterBloc.dart';
import 'package:state_tests/states/bloc/models/NotesBloc.dart';
import 'package:state_tests/states/river_pod/models/CounterNotifier.dart';
import 'package:state_tests/states/river_pod/models/NotesNotifier.dart';
import 'common/StateType.dart';
import 'common/pages/GenericPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) => MaterialApp(home: HomeScreen());
}

class HomeScreen extends StatefulWidget {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //============================================================================
  // Fields
  //============================================================================

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int currentIndex = 0;

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  void dispose() {
    CounterNotifier().manualDispose();
    NotesNotifier().manualDispose();

    CounterBloc().dispose();
    NotesBloc().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: makeHomeScreen(context, StateType.values),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  );

  //============================================================================
  // Widget Methods
  //============================================================================

  Widget makeHomeScreen(
    BuildContext context,
    List<StateType> stateTypes
  ) => DefaultTabController(
    length: stateTypes.length,
    child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text(stateTypes[currentIndex].name)),
      body: GenericPage(stateTypes[currentIndex].state),
      drawer: makeDrawer(stateTypes),
    ),
  );

  Widget makeDrawer(List<StateType> stateTypes) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Container(
            child: Text("State Tests", style: TextStyle(color: Colors.white, fontSize: 28)),
            alignment: Alignment.bottomLeft,
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ...stateTypes.mapIndexed(makeDrawerListTile)
      ]
    ),
  );

  Widget makeDrawerListTile(int index, StateType stateType) => ListTile(
    title: Row(
      children: [
        stateType.logo,
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(stateType.name),
        )
      ],
    ),
    onTap: () => onDrawerItemClicked(index)
  );

  void onDrawerItemClicked(int index) {
    _scaffoldKey.currentState?.openEndDrawer();
    setState(() => currentIndex = index);
  }
}
