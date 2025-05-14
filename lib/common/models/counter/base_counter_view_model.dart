import '../reactive_state.dart';
import 'counter_state.dart';

abstract interface class BaseCounterViewModel implements ReactiveViewModel {
  @override
  CounterState get state;

  void decrement();
  void increment();
}
