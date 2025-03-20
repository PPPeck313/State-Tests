import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesCommand {
  static final NotesCommand _instance = NotesCommand._new();

  factory NotesCommand() => _instance;

  NotesState state = NotesState.initial();

  Command<String, String> updateInputCommand;
  Command<String, NotesState> addNoteCommand;

  NotesCommand._new() {
    updateInputCommand = Command.createSync((input) => input, '');

    addNoteCommand = Command.createSync((_) {
      state = state.addNoteWithInputNew(updateInputCommand.value);
      updateInputCommand.execute('');

      return state;
    }, NotesState.initial());
  }
}
