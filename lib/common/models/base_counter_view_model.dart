import 'counter/counter_state.dart';

abstract class BaseCounterViewModel {
  CounterState get state;

  void increment();
  void decrement();
}
