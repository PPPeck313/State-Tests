import 'package:flutter/widgets.dart';
import 'package:state_tests/common/widgets/screen/page/stateful_page.dart';
import 'package:state_tests/gen/assets.gen.dart';
import 'package:state_tests/states/context/default/inherited/inherited_page_state.dart';
import 'package:state_tests/states/context/default/set_state_page_state.dart';
import 'package:state_tests/states/context/provided/bloc/bloc_page.dart';
import 'package:state_tests/states/context/provided/bloc/cubit_page.dart';
import 'package:state_tests/states/context/provided/command/command_page.dart';
import 'package:state_tests/states/context/provided/june/june_page_state.dart';
import 'package:state_tests/states/context/provided/river_pod/river_pod_page.dart';
import 'package:state_tests/states/observer/getx/get_x_page.dart';
import 'package:state_tests/states/observer/mobx/mob_x_page.dart';
import 'package:state_tests/states/observer/rebuilder/rebuilder_page.dart';
import 'package:state_tests/states/observer/redux/redux_page.dart';

enum StateType {
  setState,
  inherited(true),
  june,
  bloc,
  cubit,
  command,
  riverPod(true),
  getX,
  mobX,
  rebuilder,
  redux;

  final bool hasDivider;

  const StateType([this.hasDivider = false]);

  Widget get page => switch (this) {
    setState => StatefulPage(SetStatePageState.def(), key: Key(name)),
    inherited => StatefulPage(InheritedPageState.def(), key: Key(name)),
    bloc => BlocPage(),
    cubit => CubitPage(),
    command => CommandPage.def(),
    getX => GetXPage.def(),
    june => JunePage(),
    mobX => MobXPage.def(),
    rebuilder => RebuilderPage.def(),
    redux => ReduxPage.def(),
    riverPod => RiverPodPage(),
  };

  Image get logo =>
      switch (this) {
        setState => Assets.images.defaultLogo,
        inherited => Assets.images.defaultLogo,
        bloc => Assets.images.blocLogo,
        cubit => Assets.images.cubitLogo,
        command => Assets.images.commandLogo,
        getX => Assets.images.getxLogo,
        june => Assets.images.defaultLogo,
        mobX => Assets.images.mobxLogo,
        rebuilder => Assets.images.rebuilderLogo,
        redux => Assets.images.reduxLogo,
        riverPod => Assets.images.riverpodLogo,
      }.image();
}
