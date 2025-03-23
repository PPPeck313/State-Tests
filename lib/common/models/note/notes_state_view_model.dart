import 'package:state_tests/common/models/note/notes_state.dart';

abstract class NotesStateViewModel implements NotesStateFunctions {
  NotesState _state;
  NotesState get state => _state;

  NotesStateViewModel([this._state = const NotesState()]);

  @override
  void updateInput(String input) => _state = _state.updateInput(input);

  @override
  void addNote() => _state = _state.addNote();
}

abstract class NotesStateFunctions {
  void updateInput(String input);
  void addNote();
}

extension NotesStateExtensions on NotesState {
  NotesState updateInput(String input) => copyWith(input: input);

  NotesState addNote() {
    notes.add(input);
    return copyWith(input: '');
  }
}
