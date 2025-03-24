import 'package:meta/meta.dart';

import 'counter_state.dart';

abstract class CounterViewModel implements BaseCounterViewModel {
  CounterState _state;

  @override
  CounterState get state => _state;

  CounterViewModel([this._state = const CounterState()]);

  @protected
  @override
  CounterState increment() => _state = _state.increment();

  @protected
  @override
  CounterState decrement() => _state = _state.decrement();
}

abstract class BaseCounterViewModel {
  CounterState get state;

  void increment();
  void decrement();
}
