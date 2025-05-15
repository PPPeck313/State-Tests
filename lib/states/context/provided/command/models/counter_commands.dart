import 'package:flutter/foundation.dart';
import 'package:flutter_command/flutter_command.dart';

import 'package:state_tests/common/models/counter/base_counter_view_model.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';

class CounterCommands extends ValueNotifier<CounterState> implements BaseCounterViewModel {
  @override
  CounterState get state => value;

  late Command<void, CounterState> decrementCommand;
  late Command<void, CounterState> incrementCommand;

  CounterCommands([super._value = const CounterState()]) {
    decrementCommand = Command.createSyncNoParam<CounterState>(() => value = state.decrement(), initialValue: state)
      ..addListener(() => notifyListeners());

    incrementCommand = Command.createSyncNoParam<CounterState>(() => value = state.increment(), initialValue: state)
      ..addListener(() => notifyListeners());
  }

  @override
  void decrement() => decrementCommand();

  @override
  void increment() => incrementCommand();
}
