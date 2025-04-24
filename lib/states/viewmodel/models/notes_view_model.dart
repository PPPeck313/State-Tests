import 'package:state_tests/common/models/note/notes_state.dart';

import '../../../common/models/note/base_notes_view_model.dart';

class NotesViewModel implements BaseNotesViewModel {
  NotesState _state;

  @override
  NotesState get state => _state;

  NotesViewModel([this._state = const NotesState()]);

  @override
  NotesState updateInput(String input) => _state = _state.updateInput(input);

  @override
  NotesState addNote() => _state = _state.addNote();
}
