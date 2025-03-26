import 'package:binder/binder.dart';

import '../../../common/models/base_counter_view_model.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterLogic with Logic implements BaseCounterViewModel {
  @override
  CounterState get state => read(counterStateRef);

  @override
  final Scope scope;

  final StateRef<CounterState> counterStateRef;

  CounterLogic(this.scope, [CounterState state = const CounterState()])
    : counterStateRef = StateRef<CounterState>(state);

  @override
  void decrement() => write(counterStateRef, state.decrement());

  @override
  void increment() => write(counterStateRef, state.increment());
}
