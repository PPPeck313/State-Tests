import 'package:flutter/material.dart';
import 'package:state_tests/common/widgets/builder/typed_function.dart';

import '../../models/reactive_state.dart';

sealed class BuilderPolicy<S extends ReactiveState, VM extends ReactiveViewModel> {}

final class Fitted<S extends ReactiveState, VM extends ReactiveViewModel> extends BuilderPolicy<S, VM> {
  Widget Function(Widget Function()) fittedObserver;
  VM viewModel;

  Fitted(this.fittedObserver, this.viewModel);
}

final class Scoped<S extends ReactiveState, VM extends ReactiveViewModel> extends BuilderPolicy<S, VM> {
  Widget Function(Widget Function(ScopedArgs<S>)) scopedObserver;

  Scoped(this.scopedObserver);
}

class ScopedArgs<S> {
  S state;
  Map<String, TypedFunction> functions;

  ScopedArgs(this.state, this.functions);
}
