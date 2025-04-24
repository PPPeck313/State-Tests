import 'package:flutter/foundation.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/note/base_notes_view_model.dart';

import '../../../common/models/note/notes_state.dart';

class NotesCommands extends ValueNotifier<NotesState> implements BaseNotesViewModel {
  @override
  NotesState get state => value;

  late Command<String, NotesState> updateInputCommand;
  late Command<void, NotesState> addNoteCommand;

  NotesCommands([super._value = const NotesState()]) {
    updateInputCommand = Command.createSync<String, NotesState>(
      (input) => value = state.updateInput(input),
      initialValue: state,
    )..addListener(() => notifyListeners());

    addNoteCommand = Command.createSyncNoParam<NotesState>(() => value = state.addNote(), initialValue: state)
      ..addListener(() => notifyListeners());
  }

  @override
  void updateInput(String input) => updateInputCommand(input);

  @override
  void addNote() => addNoteCommand();
}
