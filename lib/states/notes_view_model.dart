import 'package:meta/meta.dart';
import 'package:state_tests/common/models/note/base_notes_view_model.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

class NotesViewModel with NotesViewModelBehavior {
  NotesState _state;

  @override
  NotesState get state => _state;

  @protected
  @override
  set state(NotesState value) => _state = value;
  final void Function(String)? _updateInput;
  final void Function()? _addNote;

  NotesViewModel([this._state = const NotesState(), this._updateInput, this._addNote]);

  @override
  void updateInput(String input) => _updateInput != null ? _updateInput(input) : (state = state.updateInput(input));

  @override
  void addNote() => _addNote != null ? _addNote() : (state = state.addNote());
}

abstract mixin class NotesViewModelBehavior implements BaseNotesViewModel {
  @protected
  set state(NotesState value);

  @override
  void updateInput(String input) => state = state.updateInput(input);

  @override
  void addNote() => state = state.addNote();
}
