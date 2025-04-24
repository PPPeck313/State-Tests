import '../reactive_state.dart';
import 'counter_state.dart';

abstract interface class BaseCounterViewModel implements ReactiveViewModel {
  CounterState get state;

  void increment();
  void decrement();
}
