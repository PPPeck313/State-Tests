import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/counter/CounterActions.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterCommand {

  //============================================================================
  // Fields
  //============================================================================

  CounterState state = CounterState.initial();

  Command<CounterActions, CounterState> updateCountCommand;

  //============================================================================
  // Constructors
  //============================================================================

  //TResult needs to change between commands
  CounterCommand() {
    updateCountCommand = Command.createSync((command) {
      if (command is DecrementAction) {
        state = state.decrementNew();
      }

      else if (command is IncrementAction) {
        state = state.incrementNew();
      }

      return state;
    }, CounterState.initial());
  }
}