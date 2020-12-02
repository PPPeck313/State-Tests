import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/states/bloc/models/CounterBloc.dart';
import 'package:state_tests/states/bloc/models/NotesBloc.dart';
import 'package:state_tests/states/river_pod/models/CounterNotifier.dart';
import 'package:state_tests/states/river_pod/models/NotesNotifier.dart';
import 'package:vnum/vnum.dart';
import 'common/StatePageEnum.dart';
import 'main.reflectable.dart';


void main() {
  initializeReflectable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen()
    );
  }
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
  Widget build(BuildContext context) {
    List<Widget> pages = List<Widget>();

    for (StatePageEnum statePageEnum in Vnum.allCasesFor(StatePageEnum)) {
      pages.add(statePageEnum.statePage());
    }

    return MaterialApp(
        home: makeHomeScreen(context, pages),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
    );
  }

  //============================================================================
  // Widget Methods
  //============================================================================

  Widget makeHomeScreen(BuildContext context, List<Widget> pages) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(title: Text(Vnum.allCasesFor(StatePageEnum)[currentIndex].value)),
        // makeTopTabBar(),
        body: (Vnum.allCasesFor(StatePageEnum)[currentIndex] as StatePageEnum).statePage(),
        //TabBarView(children: pages),
        drawer: makeDrawer(),
      ),
    );
  }



  Widget makeTopTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(74.0),
      child: SafeArea(
        child: AppBar(
            flexibleSpace: makeTabBar()
        ),
      ),
    );
  }

  Widget makeTabBar() {
    List<Tab> tabs = List<Tab>();

    for (StatePageEnum statePageEnum in Vnum.allCasesFor(StatePageEnum)) {
      tabs.add(Tab(icon: statePageEnum.image(), text: statePageEnum.shortName()));
    }

    return TabBar(
        tabs: tabs
    );
  }



  Widget makeDrawer() {
    List<Widget> items = List<Widget>();

    items.add(DrawerHeader(
      child: Container(
        child: Text("State Tests", style: TextStyle(color: Colors.white, fontSize: 28)),
        alignment: Alignment.bottomLeft,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    ));

    for (int i = 0; i < Vnum.allCasesFor(StatePageEnum).length; i++) {
      items.add(makeDrawerListTile(Vnum.allCasesFor(StatePageEnum)[i], i));
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: items
      )
    );
  }

  Widget makeDrawerListTile(StatePageEnum statePageEnum, int index) {
    return ListTile(
      title: Row(
        children: <Widget>[
          statePageEnum.image(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(statePageEnum.value),
          )
        ],
      ),
      onTap: () => onDrawerItemClicked(index)
    );
  }

  void onDrawerItemClicked(int index) {
    _scaffoldKey.currentState.openEndDrawer();
    setState(() => { currentIndex = index });
  }
}
