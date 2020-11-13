import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesCommand {

  //============================================================================
  // Fields
  //============================================================================

  NotesState state = NotesState.initial();

  Command<String, String> updateInputCommand;
  Command<String, NotesState> addNoteCommand;

  //============================================================================
  // Constructors
  //============================================================================

  NotesCommand() {
    updateInputCommand = Command.createSync((input) => input, '');

    addNoteCommand = Command.createSync((_) {
      state = state.addNoteWithInputNew(updateInputCommand.value);
      updateInputCommand.execute('');

      return state;
    }, NotesState.initial());
  }
}