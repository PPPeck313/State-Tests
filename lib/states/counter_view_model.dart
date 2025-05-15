import 'package:meta/meta.dart';
import 'package:state_tests/common/models/counter/base_counter_view_model.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';

class CounterViewModel with CounterViewModelBehavior {
  CounterState _state;

  @override
  CounterState get state => _state;

  @protected
  @override
  set state(CounterState value) => _state = value;
  final void Function()? _decrement;
  final void Function()? _increment;

  CounterViewModel([this._state = const CounterState(), this._decrement, this._increment]);

  @override
  void decrement() => _decrement != null ? _decrement() : state = state.decrement();

  @override
  void increment() => _increment != null ? _increment() : state = state.increment();
}

abstract mixin class CounterViewModelBehavior implements BaseCounterViewModel {
  @protected
  set state(CounterState value);

  @override
  void decrement() => state = state.decrement();

  @override
  void increment() => state = state.increment();
}
