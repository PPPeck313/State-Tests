import 'package:flutter/widgets.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/states/binder/BinderPage.dart';
import 'package:state_tests/states/bloc/BlocPage.dart';
import 'package:state_tests/states/bloc/CubitPage.dart';
import 'package:state_tests/states/command/CommandPage.dart';
import 'package:state_tests/states/getx/GetXPage.dart';
import 'package:state_tests/states/mobx/MobXPage.dart';
import 'package:state_tests/states/rebuilder/RebuilderPage.dart';
import 'package:state_tests/states/redux/ReduxPage.dart';
import 'package:state_tests/states/river_pod/RiverPodPage.dart';

import '../gen/assets.gen.dart';

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
