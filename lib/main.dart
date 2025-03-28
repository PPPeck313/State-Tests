import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:state_tests/states/bloc/bloc_observer.dart';

import 'common/state_type.dart';
import 'common/widgets/generic_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(home: HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Bloc.observer = SimpleBlocObserver();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: makeHomeScreen(context, StateType.values),
    theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
  );

  Widget makeHomeScreen(BuildContext context, List<StateType> stateTypes) => DefaultTabController(
    length: stateTypes.length,
    child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text(stateTypes[currentIndex].name)),
      body: GenericPage(stateTypes[currentIndex].page),
      drawer: makeDrawer(stateTypes),
    ),
  );

  Widget makeDrawer(List<StateType> stateTypes) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Text('State Tests', style: TextStyle(color: Colors.white, fontSize: 28)),
          ),
        ),
        ...stateTypes.mapIndexed(makeDrawerListTile),
      ],
    ),
  );

  Widget makeDrawerListTile(int index, StateType stateType) => ListTile(
    title: Row(children: [stateType.logo, Padding(padding: EdgeInsets.only(left: 8.0), child: Text(stateType.name))]),
    onTap: () => onDrawerItemClicked(index),
  );

  void onDrawerItemClicked(int index) {
    _scaffoldKey.currentState?.openEndDrawer();
    setState(() => currentIndex = index);
  }
}
