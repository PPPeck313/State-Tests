import 'package:state_tests/common/models/reactive_state.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';

abstract interface class BaseCounterViewModel implements ReactiveViewModel {
  @override
  CounterState get state;

  void decrement();
  void increment();
}
