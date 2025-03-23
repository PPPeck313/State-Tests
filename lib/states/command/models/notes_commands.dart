import 'package:flutter_command/flutter_command.dart';
import 'package:meta/meta.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/common/models/note/notes_state_view_model.dart';

class NotesCommands extends NotesStateViewModel {
  late Command<String, NotesState> updateInputCommand;
  late Command<void, NotesState> addNoteCommand;

  NotesCommands([super._state = const NotesState()]) {
    updateInputCommand = Command.createSync<String, NotesState>((String val) => updateInput(val), initialValue: state);
    addNoteCommand = Command.createSyncNoParam<NotesState>(() => addNote(), initialValue: state);
  }

  @protected
  @override
  NotesState updateInput(String input) {
    super.updateInput(input);
    return state;
  }

  @protected
  @override
  NotesState addNote() {
    super.addNote();
    return state;
  }
}
