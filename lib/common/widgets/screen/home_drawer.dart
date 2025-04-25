import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../builder/state_type.dart';

part 'home_drawer.g.dart';

@swidget
Widget homeDrawer(List<StateType> stateTypes, void Function(StateType) setState) => Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [HomeDrawerHeader(), ...stateTypes.map((stateType) => DrawerCell(stateType, setState))],
  ),
);

@swidget
Widget homeDrawerHeader() => DrawerHeader(
  decoration: BoxDecoration(color: Colors.blue),
  child: Container(
    alignment: Alignment.bottomLeft,
    child: Text('State Tests', style: TextStyle(color: Colors.white, fontSize: 28)),
  ),
);

@swidget
Widget drawerCell(StateType stateType, void Function(StateType) setState) => ListTile(
  title: Row(children: [stateType.logo, Padding(padding: EdgeInsets.only(left: 8.0), child: Text(stateType.name))]),
  onTap: () => setState(stateType),
);
