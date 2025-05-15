import 'package:june/june.dart';
import 'package:state_tests/common/extensions/_scope.dart';
import 'package:state_tests/common/models/counter/base_counter_view_model.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';

class CounterJune extends JuneState implements BaseCounterViewModel {
  CounterState _state;

  @override
  CounterState get state => _state;

  CounterJune([this._state = const CounterState()]);

  @override
  void decrement() => June.getState(() => CounterJune()).let((it) {
    it._state = it.state.decrement();
    it.setState();
  });

  @override
  void increment() => June.getState(() => CounterJune()).let((it) {
    it._state = it.state.increment();
    it.setState();
  });
}
