import 'package:state_tests/common/models/note/notes_state.dart';

import 'package:state_tests/common/models/note/base_notes_view_model.dart';

class NotesViewModel implements BaseNotesViewModel {
  NotesState _state;

  final void Function(String)? _updateInput;
  final void Function()? _addNote;

  @override
  NotesState get state => _state;

  NotesViewModel([this._state = const NotesState(), this._updateInput, this._addNote]);

  @override
  void updateInput(String input) => _updateInput == null ? (_state = _state.updateInput(input)) : _updateInput(input);

  @override
  void addNote() => _addNote == null ? (_state = _state.addNote()) : _addNote();
}
