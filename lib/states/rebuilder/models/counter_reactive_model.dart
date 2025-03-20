import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterReactiveModel {
  static final CounterReactiveModel _instance = CounterReactiveModel._new(CounterState.initial());

  factory CounterReactiveModel() => _instance;

  CounterState state;

  CounterReactiveModel._new(this.state);

  void decrement() => state.decrement();

  void increment() => state.increment();
}
