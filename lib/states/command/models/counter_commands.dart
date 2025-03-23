import 'package:flutter/cupertino.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/counter/counter_state_view_model.dart';

import '../../../common/models/counter/counter_state.dart';

class CounterCommands extends CounterStateViewModel {
  late Command<void, CounterState> decrementCommand;
  late Command<void, CounterState> incrementCommand;

  CounterCommands([super._state = const CounterState()]) {
    decrementCommand = Command.createSyncNoParam<CounterState>(() => decrement(), initialValue: state);
    incrementCommand = Command.createSyncNoParam<CounterState>(() => increment(), initialValue: state);
  }

  @protected
  @override
  CounterState decrement() {
    super.decrement();
    return state;
  }

  @protected
  @override
  CounterState increment() {
    super.increment();
    return state;
  }
}
