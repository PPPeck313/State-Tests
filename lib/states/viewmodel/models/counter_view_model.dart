import '../../../common/models/counter/base_counter_view_model.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterViewModel implements BaseCounterViewModel {
  CounterState _state;

  @override
  CounterState get state => _state;

  CounterViewModel([this._state = const CounterState()]);

  @override
  void increment() => _state = _state.increment();

  @override
  void decrement() => _state = _state.decrement();
}
