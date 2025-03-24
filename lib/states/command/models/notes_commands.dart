import 'package:flutter_command/flutter_command.dart';

import '../../../common/models/note/notes_state.dart';
import '../../../common/models/note/notes_view_model.dart';

class NotesCommands extends NotesViewModel {
  late Command<String, NotesState> updateInputCommand;
  late Command<void, NotesState> addNoteCommand;

  NotesCommands([super._state = const NotesState()]) {
    updateInputCommand = Command.createSync<String, NotesState>((String val) => updateInput(val), initialValue: state);
    addNoteCommand = Command.createSyncNoParam<NotesState>(() => addNote(), initialValue: state);
  }
}
