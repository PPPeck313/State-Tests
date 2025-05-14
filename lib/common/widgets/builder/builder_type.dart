import 'package:flutter/material.dart';

import 'package:state_tests/common/models/reactive_state.dart';

sealed class BuilderType<VM extends ReactiveViewModel> {
  covariant Widget Function(Widget Function(void) builder) obs;

  BuilderType(this.obs);
}

final class ViewModelScope<VM extends ReactiveViewModel> extends BuilderType<VM> {
  VM viewModel;

  ViewModelScope(super.obs, this.viewModel);
}

final class ProvidedContextScope<VM extends ReactiveViewModel> extends BuilderType<VM> {
  @override
  Widget Function(Widget Function(VM) builder) obs;

  ProvidedContextScope(this.obs) : super(obs);
}

final class DefaultContextScope<VM extends ReactiveViewModel> extends BuilderType<VM> {
  @override
  Widget Function(Widget Function(VM) builder, {BuildContext scope}) obs;

  DefaultContextScope(this.obs) : super(obs);
}
