import 'package:flutter/widgets.dart';
import 'package:state_tests/common/widgets/screen/page/stateful_page.dart';

import 'package:state_tests/gen/assets.gen.dart';
import 'package:state_tests/states/bloc/bloc_page.dart';
import 'package:state_tests/states/bloc/cubit_page.dart';
import 'package:state_tests/states/command/command_page.dart';
import 'package:state_tests/states/default/inherited/inherited_page_state.dart';
import 'package:state_tests/states/default/set_state_page_state.dart';
import 'package:state_tests/states/getx/get_x_page.dart';
import 'package:state_tests/states/mobx/mob_x_page.dart';
import 'package:state_tests/states/rebuilder/rebuilder_page.dart';
import 'package:state_tests/states/redux/redux_page.dart';
import 'package:state_tests/states/river_pod/river_pod_page.dart';

enum StateType {
  bloc,
  cubit,
  command,
  getX,
  mobX,
  rebuilder,
  redux,
  riverPod,
  setState,
  inherited;

  Widget get page => switch (this) {
    bloc => BlocPage(),
    cubit => CubitPage(),
    command => CommandPage.def(),
    getX => GetXPage.def(),
    mobX => MobXPage.def(),
    rebuilder => RebuilderPage.def(),
    redux => ReduxPage.def(),
    riverPod => RiverPodPage(),
    setState => StatefulPage(SetStatePageState.def(), key: Key(setState.name)),
    inherited => StatefulPage(InheritedPageState.def(), key: Key(inherited.name)),
  };

  Image get logo =>
      switch (this) {
        bloc => Assets.images.blocLogo,
        cubit => Assets.images.cubitLogo,
        command => Assets.images.commandLogo,
        getX => Assets.images.getxLogo,
        mobX => Assets.images.mobxLogo,
        rebuilder => Assets.images.rebuilderLogo,
        redux => Assets.images.reduxLogo,
        riverPod => Assets.images.riverpodLogo,
        setState => Assets.images.defaultLogo,
        inherited => Assets.images.defaultLogo,
      }.image();
}
