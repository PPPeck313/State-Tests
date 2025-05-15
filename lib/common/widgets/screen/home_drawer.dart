import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/extensions/_string.dart';
import 'package:state_tests/common/widgets/builder/state_type.dart';
import 'package:state_tests/common/widgets/debug/debug_padding.dart';

part 'home_drawer.g.dart';

@swidget
Widget homeDrawer(List<StateType> stateTypes, void Function(StateType) setStateType) => Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [HomeDrawerHeader(), ...stateTypes.map((stateType) => DrawerCell(stateType, setStateType))],
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
Widget drawerCell(StateType stateType, void Function(StateType) setStateType) => Column(
  children: [
    ListTile(
      title: Row(
        children: [
          stateType.logo,
          MyPadding(padding: EdgeInsets.only(left: 8.0), child: Text(stateType.name.toCapitalized)),
        ],
      ),
      onTap: () => setStateType(stateType),
    ),
    stateType.hasDivider
        ? Divider(height: 10, color: Colors.blue, thickness: 1, indent: 15, endIndent: 15)
        : SizedBox.shrink(),
  ],
);
