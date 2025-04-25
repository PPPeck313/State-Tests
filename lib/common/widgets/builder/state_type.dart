import 'package:flutter/widgets.dart';
import 'package:state_tests/common/widgets/screen/page/stateful_page.dart';
import 'package:state_tests/states/viewmodel/view_model_page_state.dart';

import '../../../gen/assets.gen.dart';
import '../../../states/bloc/bloc_page.dart';
import '../../../states/bloc/cubit_page.dart';
import '../../../states/command/command_page.dart';
import '../../../states/getx/get_x_page.dart';
import '../../../states/mobx/mob_x_page.dart';
import '../../../states/rebuilder/rebuilder_page.dart';
import '../../../states/redux/redux_page.dart';
import '../../../states/river_pod/river_pod_page.dart';

enum StateType {
  bloc,
  cubit,
  command,
  getX,
  mobX,
  rebuilder,
  redux,
  riverPod,
  viewModel;

  Widget get page => switch (this) {
    bloc => BlocPage(),
    cubit => CubitPage(),
    command => CommandPage.def(),
    getX => GetXPage.def(),
    mobX => MobXPage.def(),
    rebuilder => RebuilderPage.def(),
    redux => ReduxPage.def(),
    riverPod => RiverPodPage(),
    viewModel => StatefulPage(ViewModelPageState.def()),
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
        viewModel => Assets.images.viewmodelLogo,
      }.image();
}
