import 'package:flutter/widgets.dart';
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

  //============================================================================
  // Enums
  //============================================================================

  binder(BinderPage(), "Bi"),
  bloc(BlocPage(), "Bl"),
  cubit(CubitPage(), "Cu"),
  command(CommandPage(), "Co"),
  getX(GetXPage(), "GX"),
  mobX(MobXPage(), "MX"),
  rebuilder(RebuilderPage(), "Rb"),
  redux(ReduxPage(), "Rb"),
  riverPod(RiverPodPage(), "Rb");

  //============================================================================
  // Fields
  //============================================================================

  final Widget page;
  final String abbreviation;

  //============================================================================
  // Constructor
  //============================================================================

  const StateType(this.page, this.abbreviation);

  //============================================================================
  // Functions
  //============================================================================

  Image get logo => switch(this) {
    binder => Assets.images.binderLogo,
    bloc => Assets.images.binderLogo,
    cubit => Assets.images.binderLogo,
    command => Assets.images.binderLogo,
    getX => Assets.images.binderLogo,
    mobX => Assets.images.binderLogo,
    rebuilder => Assets.images.binderLogo,
    redux => Assets.images.binderLogo,
    riverPod => Assets.images.binderLogo
  }.image();
}