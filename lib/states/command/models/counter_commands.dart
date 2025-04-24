import 'package:flutter_command/flutter_command.dart';

import '../../../common/models/counter/base_counter_view_model.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterCommands implements BaseCounterViewModel {
  CounterState _state;

  @override
  CounterState get state => _state;

  late Command<void, CounterState> decrementCommand;
  late Command<void, CounterState> incrementCommand;

  CounterCommands([this._state = const CounterState()]) {
    decrementCommand = Command.createSyncNoParam<CounterState>(() => _state = state.decrement(), initialValue: state);
    incrementCommand = Command.createSyncNoParam<CounterState>(() => _state = state.increment(), initialValue: state);
  }

  @override
  void increment() => decrementCommand();

  @override
  void decrement() => incrementCommand();
}
