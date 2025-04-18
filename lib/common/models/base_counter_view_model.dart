import 'counter/counter_state.dart';

abstract interface class BaseCounterViewModel {
  CounterState get state;

  void increment();
  void decrement();
}
