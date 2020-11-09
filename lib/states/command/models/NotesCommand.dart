import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/ListExtension.dart';

class NotesCommand {

  //============================================================================
  // Fields
  //============================================================================

  NotesState state = NotesState.initial();

  Command<String, String> inputChangedCommand;
  Command<String, NotesState> updateNotesCommand;

  //============================================================================
  // Constructors
  //============================================================================

  NotesCommand() {
    inputChangedCommand = Command.createSync((x) => x, '');
    updateNotesCommand = Command.createSync((input) {
      state = state.copyWith(notes: state.notes.concat(input));
      inputChangedCommand.execute('');

      return state;
    }, NotesState.initial());
  }
}