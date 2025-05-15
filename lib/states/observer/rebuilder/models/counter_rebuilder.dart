import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/states/counter_view_model.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class CounterRebuilder with CounterViewModelBehavior {
  final Injected<CounterState> _injectedState;

  @override
  CounterState get state => _injectedState.state;

  @override
  set state(CounterState value) => _injectedState.state = value;

  CounterRebuilder([CounterState state = const CounterState()]) : _injectedState = RM.inject<CounterState>(() => state);
}
