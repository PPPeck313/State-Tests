import 'package:flutter/material.dart';

import '../../models/reactive_state.dart';

sealed class BuilderType<VM extends ReactiveViewModel> {
  covariant Widget Function(Widget Function(void)) obs;

  BuilderType(this.obs);
}

final class Fitted<VM extends ReactiveViewModel> extends BuilderType<VM> {
  VM viewModel;

  Fitted(super.obs, this.viewModel);
}

final class Scoped<VM extends ReactiveViewModel> extends BuilderType<VM> {
  @override
  Widget Function(Widget Function(VM)) obs;

  Scoped(this.obs) : super(obs);
}
