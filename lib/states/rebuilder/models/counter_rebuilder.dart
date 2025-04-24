import 'package:states_rebuilder/scr/state_management/rm.dart';

import '../../../common/models/counter/base_counter_view_model.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterRebuilder implements BaseCounterViewModel {
  final Injected<CounterState> injectedState;

  @override
  CounterState get state => injectedState.state;

  CounterRebuilder([CounterState state = const CounterState()]) : injectedState = RM.inject<CounterState>(() => state);

  @override
  void decrement() => injectedState.state = state.decrement();

  @override
  void increment() => injectedState.state = state.increment();
}
