import 'counter_state.dart';

class CounterStateViewModel extends BaseCounterStateViewModel implements CounterStateFunctions {
  late CounterState _state;

  @override
  CounterState get state => _state;

  CounterStateViewModel([super.state = const CounterState()]) {
    _state = super.state;
  }
}

abstract class BaseCounterStateViewModel implements CounterStateFunctions {
  CounterState state;

  BaseCounterStateViewModel([this.state = const CounterState()]);

  @override
  void increment() => state = state.increment();

  @override
  void decrement() => state = state.decrement();
}

abstract class CounterStateFunctions {
  void increment();
  void decrement();
}
