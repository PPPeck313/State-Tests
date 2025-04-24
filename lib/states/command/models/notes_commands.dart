import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/note/base_notes_view_model.dart';

import '../../../common/models/note/notes_state.dart';

class NotesCommands implements BaseNotesViewModel {
  NotesState _state;

  @override
  NotesState get state => _state;

  late Command<String, NotesState> updateInputCommand;
  late Command<void, NotesState> addNoteCommand;

  NotesCommands([this._state = const NotesState()]) {
    updateInputCommand = Command.createSync<String, NotesState>(
      (String input) => _state = state.updateInput(input),
      initialValue: state,
    );

    addNoteCommand = Command.createSyncNoParam<NotesState>(() => _state = state.addNote(), initialValue: state);
  }

  @override
  void updateInput(String input) => updateInputCommand(input);

  @override
  void addNote() => addNoteCommand();
}
