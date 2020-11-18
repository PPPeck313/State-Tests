import 'package:flutter/material.dart';
import 'package:state_tests/common/Drawables.dart';
import 'package:state_tests/states/binder/BinderPage.dart';
import 'package:state_tests/states/bloc/BlocPage.dart';
import 'package:state_tests/states/bloc/CubitPage.dart';
import 'package:state_tests/states/command/CommandPage.dart';
import 'package:state_tests/states/getx/GetXPage.dart';
import 'package:state_tests/states/mobx/MobXPage.dart';
import 'package:state_tests/states/rebuilder/RebuilderPage.dart';
import 'package:state_tests/states/redux/ReduxPage.dart';
import 'package:state_tests/states/river_pod/RiverPodPage.dart';
import 'package:state_tests/states/river_pod/models/CounterNotifier.dart';
import 'package:state_tests/states/river_pod/models/NotesNotifier.dart';

import 'common/widgets/RetainedTab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  void dispose() {
    CounterNotifier().manualDispose();
    NotesNotifier().manualDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: makeTopTabScreen(context, [
            BinderPage(),
            BlocPage(),
            CubitPage(),
            CommandPage(),
            GetXPage(),
            MobxPage(),
            RebuilderPage(),
            ReduxPage(),
            RiverPodPage(),
          ]
        ),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
    );
  }

  //============================================================================
  // Widget Methods
  //============================================================================

  Widget makeTopTabScreen(BuildContext context, List<Widget> tabs) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: makeTopTabBar(),
        body: TabBarView(
            children: tabs
        ),
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
    return TabBar(
        tabs: [
          Tab(icon: Image.asset(Drawables.binder_logo), text: "Bi"),
          Tab(icon: Image.asset(Drawables.bloc_logo), text: "Bl"),
          Tab(icon: Image.asset(Drawables.cubit_logo), text: "Cb"),
          Tab(icon: Image.asset(Drawables.command_logo), text: "Co"),
          Tab(icon: Image.asset(Drawables.getx_logo), text: "GX"),
          Tab(icon: Image.asset(Drawables.mobx_logo), text: "MX"),
          Tab(icon: Image.asset(Drawables.rebuilder_logo), text: "Rb"),
          Tab(icon: Image.asset(Drawables.redux_logo), text: "Rd"),
          Tab(icon: Image.asset(Drawables.riverpod_logo), text: "Rp")
        ]
    );
  }
}
