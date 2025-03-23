import 'package:binder/binder.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';

import '../../../common/models/counter/counter_state_view_model.dart';

class CounterLogic extends CounterStateViewModel with Logic {
  @override
  final Scope scope;
  final StateRef<CounterState> counterStateRef;

  factory CounterLogic(Scope scope, [CounterState state = const CounterState()]) {
    StateRef<CounterState> counterStateRef = StateRef<CounterState>(state);
    return CounterLogic._internal(scope, counterStateRef);
  }

  CounterLogic._internal(this.scope, this.counterStateRef) : super(scope.read(counterStateRef, null));

  @override
  void decrement() => write(counterStateRef, state.decrement());

  @override
  void increment() => write(counterStateRef, state.increment());
}
