import 'package:flutter/widgets.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:state_tests/states/binder/BinderPage.dart';
import 'package:state_tests/states/bloc/BlocPage.dart';
import 'package:state_tests/states/bloc/CubitPage.dart';
import 'package:state_tests/states/command/CommandPage.dart';
import 'package:state_tests/states/getx/GetXPage.dart';
import 'package:state_tests/states/mobx/MobXPage.dart';
import 'package:state_tests/states/rebuilder/RebuilderPage.dart';
import 'package:state_tests/states/redux/ReduxPage.dart';
import 'package:state_tests/states/river_pod/RiverPodPage.dart';
import 'package:vnum/vnum.dart';

import 'Drawables.dart';

@VnumDefinition
class StatePageEnum extends Vnum<String> {

  //============================================================================
  // Enums
  //============================================================================

  static const StatePageEnum binder = const StatePageEnum.define("Binder");
  static const StatePageEnum bloc = const StatePageEnum.define("Bloc");
  static const StatePageEnum cubit = const StatePageEnum.define("Cubit");
  static const StatePageEnum command = const StatePageEnum.define("Command");
  static const StatePageEnum getX = const StatePageEnum.define("GetX");
  static const StatePageEnum mobX = const StatePageEnum.define("MobX");
  static const StatePageEnum rebuilder = const StatePageEnum.define("Rebuilder");
  static const StatePageEnum redux = const StatePageEnum.define("Redux");
  static const StatePageEnum riverPod = const StatePageEnum.define("RiverPod");

  //============================================================================
  // Constructors
  //============================================================================

  const StatePageEnum.define(String fromValue) : super.define(fromValue);
  factory StatePageEnum(String value) => Vnum.fromValue(value, StatePageEnum);

  //============================================================================
  // Serialization Methods
  //============================================================================

  dynamic toJson() => this.value;
  factory StatePageEnum.fromJson(dynamic json) => StatePageEnum(json);

  //============================================================================
  // Instance Methods
  //============================================================================

  Widget statePage() {
    if (value == StatePageEnum.binder.value) {
      return BinderPage();
    }

    else if (value == StatePageEnum.bloc.value) {
      return BlocPage();
    }

    else if (value == StatePageEnum.cubit.value) {
      return CubitPage();
    }

    else if (value == StatePageEnum.command.value) {
      return CommandPage();
    }

    else if (value == StatePageEnum.getX.value) {
      return GetXPage();
    }

    else if (value == StatePageEnum.mobX.value) {
      return MobXPage();
    }

    else if (value == StatePageEnum.rebuilder.value) {
      return RebuilderPage();
    }

    else if (value == StatePageEnum.redux.value) {
      return ReduxPage();
    }

    else if (value == StatePageEnum.riverPod.value) {
      return RiverPodPage();
    }

    return null;
  }



  String shortName() {
    if (value == StatePageEnum.binder.value) {
      return "Bi";
    }

    else if (value == StatePageEnum.bloc.value) {
      return "Bl";
    }

    else if (value == StatePageEnum.cubit.value) {
      return "Cb";
    }

    else if (value == StatePageEnum.command.value) {
      return "Co";
    }

    else if (value == StatePageEnum.getX.value) {
      return "GX";
    }

    else if (value == StatePageEnum.mobX.value) {
      return "MX";
    }

    else if (value == StatePageEnum.rebuilder.value) {
      return "Rb";
    }

    else if (value == StatePageEnum.redux.value) {
      return "Rd";
    }

    else if (value == StatePageEnum.riverPod.value) {
      return "Rp";
    }

    return "";
  }



  Image image() {
    if (value == StatePageEnum.binder.value) {
      return Image.asset(Drawables.binder_logo);
    }

    else if (value == StatePageEnum.bloc.value) {
      return Image.asset(Drawables.bloc_logo);
    }

    else if (value == StatePageEnum.cubit.value) {
      return Image.asset(Drawables.cubit_logo);
    }

    else if (value == StatePageEnum.command.value) {
      return Image.asset(Drawables.command_logo);
    }

    else if (value == StatePageEnum.getX.value) {
      return Image.asset(Drawables.getx_logo);
    }

    else if (value == StatePageEnum.mobX.value) {
      return Image.asset(Drawables.mobx_logo);
    }

    else if (value == StatePageEnum.rebuilder.value) {
      return Image.asset(Drawables.rebuilder_logo);
    }

    else if (value == StatePageEnum.redux.value) {
      return Image.asset(Drawables.redux_logo);
    }

    else if (value == StatePageEnum.riverPod.value) {
      return Image.asset(Drawables.riverpod_logo);
    }

    return null;
  }
}