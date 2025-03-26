import 'package:meta/meta.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

import '../../../common/models/base_notes_view_model.dart';

class NotesViewModel implements BaseNotesViewModel {
  NotesState _state;

  @override
  NotesState get state => _state;

  NotesViewModel([this._state = const NotesState()]);

  @protected
  @override
  NotesState updateInput(String input) => _state = _state.updateInput(input);

  @protected
  @override
  NotesState addNote() => _state = _state.addNote();
}
