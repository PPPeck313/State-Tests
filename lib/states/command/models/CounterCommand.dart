import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/counter/CounterActions.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterCommand {

  //============================================================================
  // Static Fields
  //============================================================================

  static CounterCommand _instance = CounterCommand._new();

  factory CounterCommand() => _instance;

  //============================================================================
  // Fields
  //============================================================================

  CounterState state = CounterState.initial();

  Command<CounterActions, CounterState> updateCountCommand;

  //============================================================================
  // Constructors
  //============================================================================

  //Result needs to change between commands
  CounterCommand._new() {
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