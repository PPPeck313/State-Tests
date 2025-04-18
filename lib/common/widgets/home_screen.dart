import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../common/extensions/_string.dart';
import '../../states/bloc/bloc_observer.dart';
import '../state_type.dart';
import 'generic_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StateType currentStateType = StateType.bloc;

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
      appBar: AppBar(title: Text(currentStateType.name.toCapitalized)),
      body: GenericPage(currentStateType.page, key: Key(currentStateType.name)),
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
        ...stateTypes.map(makeDrawerListTile),
      ],
    ),
  );

  Widget makeDrawerListTile(StateType stateType) => ListTile(
    title: Row(children: [stateType.logo, Padding(padding: EdgeInsets.only(left: 8.0), child: Text(stateType.name))]),
    onTap: () => onDrawerItemClicked(stateType),
  );

  void onDrawerItemClicked(StateType stateType) {
    _scaffoldKey.currentState?.openEndDrawer();
    setState(() => currentStateType = stateType);
  }
}
