import 'package:binder/binder.dart';

import '../../../common/models/base_counter_view_model.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterLogicController {
  final LogicRef logicRef;
  final StateRef<CounterState> stateRef;

  CounterLogicController([CounterState state = const CounterState()]) : this._internal(StateRef<CounterState>(state));

  CounterLogicController._internal(this.stateRef) : logicRef = LogicRef((scope) => CounterLogic(scope, stateRef));
}

class CounterLogic with Logic implements BaseCounterViewModel {
  @override
  CounterState get state => read(stateRef);

  @override
  final Scope scope;

  final StateRef<CounterState> stateRef;

  CounterLogic(this.scope, this.stateRef);

  @override
  void decrement() => write(stateRef, state.decrement());

  @override
  void increment() => write(stateRef, state.increment());
}
