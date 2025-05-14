import '../common/models/counter/base_counter_view_model.dart';
import '../common/models/counter/counter_state.dart';

class CounterViewModel implements BaseCounterViewModel {
  CounterState _state;

  final void Function()? _decrementFun;
  final void Function()? _incrementFun;

  @override
  CounterState get state => _state;

  CounterViewModel([this._state = const CounterState(), this._decrementFun, this._incrementFun]);

  @override
  void decrement() => _decrementFun == null ? (_state = _state.decrement()) : _decrementFun();

  @override
  void increment() => _incrementFun == null ? (_state = _state.increment()) : _incrementFun();
}
