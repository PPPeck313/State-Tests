import 'package:flutter/material.dart';
import 'package:state_tests/states/binder/BinderPage.dart';
import 'package:state_tests/states/bloc/BlocPage.dart';
import 'package:state_tests/states/command/CommandPage.dart';
import 'package:state_tests/states/mobx/MobXPage.dart';
import 'package:state_tests/states/rebuilder/RebuilderPage.dart';
import 'package:state_tests/states/river_pod/RiverPodPage.dart';

import 'common/widgets/RetainedTab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: makeTopTabScreen(context, [
            RetainedTab(BinderPage()),
            RetainedTab(BlocPage()),
            RetainedTab(CommandPage()),
            RetainedTab(MobxPage()),
            RetainedTab(RebuilderPage()),
            RetainedTab(RiverPodPage()),
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
          Tab(icon: Icon(Icons.book), text: "Binder"),
          Tab(icon: Icon(Icons.crop_square), text: "Bloc"),
          Tab(icon: Icon(Icons.message), text: "Command"),
          Tab(icon: Icon(Icons.clear), text: "MobX"),
          Tab(icon: Icon(Icons.handyman), text: "Rebuilder"),
          Tab(icon: Icon(Icons.water_damage), text: "RiverPod")
        ]
    );
  }
}
