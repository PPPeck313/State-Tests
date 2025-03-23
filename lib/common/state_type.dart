import 'package:flutter/widgets.dart';
import 'package:state_tests/common/pages/generic_page.dart';

import '../gen/assets.gen.dart';
import '../states/binder/binder_page.dart';
import '../states/bloc/bloc_page.dart';
import '../states/bloc/cubit_page.dart';
import '../states/command/command_page.dart';
import '../states/getx/get_x_page.dart';
import '../states/mobx/mob_x_page.dart';
import '../states/rebuilder/rebuilder_page.dart';
import '../states/redux/redux_page.dart';
import '../states/river_pod/river_pod_page.dart';

enum StateType {
  binder('Bi'),
  bloc('Bl'),
  cubit('Cu'),
  command('Co'),
  getX('GX'),
  mobX('MX'),
  rebuilder('Rb'),
  redux('Rd'),
  riverPod('Rp');

  final String abbreviation;

  const StateType(this.abbreviation);

  GenericPageState get page => switch (this) {
    binder => BinderPage(),
    bloc => BlocPage(),
    cubit => CubitPage(),
    command => CommandPage(),
    getX => GetXPage(),
    mobX => MobXPage(),
    rebuilder => RebuilderPage(),
    redux => ReduxPage(),
    riverPod => RiverPodPage(),
  };

  Image get logo =>
      switch (this) {
        binder => Assets.images.binderLogo,
        bloc => Assets.images.binderLogo,
        cubit => Assets.images.binderLogo,
        command => Assets.images.binderLogo,
        getX => Assets.images.binderLogo,
        mobX => Assets.images.binderLogo,
        rebuilder => Assets.images.binderLogo,
        redux => Assets.images.binderLogo,
        riverPod => Assets.images.binderLogo,
      }.image();
}
