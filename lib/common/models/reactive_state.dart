abstract interface class ReactiveState {}

abstract interface class ReactiveViewModel<S extends ReactiveState> {
  S get state;
}
