import 'package:flutter_command/flutter_command.dart';

import '../../../common/models/counter/counter_state.dart';
import '../../../common/models/counter/counter_view_model.dart';

class CounterCommands extends CounterViewModel {
  late Command<void, CounterState> decrementCommand;
  late Command<void, CounterState> incrementCommand;

  CounterCommands([super._state = const CounterState()]) {
    decrementCommand = Command.createSyncNoParam<CounterState>(() => decrement(), initialValue: state);
    incrementCommand = Command.createSyncNoParam<CounterState>(() => increment(), initialValue: state);
  }
}
