import 'package:meta/meta.dart';

import '../../../common/models/base_counter_view_model.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterViewModel implements BaseCounterViewModel {
  CounterState _state;

  @override
  CounterState get state => _state;

  CounterViewModel([this._state = const CounterState()]);

  @protected
  @override
  void increment() => _state = _state.increment();

  @protected
  @override
  void decrement() => _state = _state.decrement();
}
