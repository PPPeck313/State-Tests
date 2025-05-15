import 'package:june/june.dart';
import 'package:state_tests/common/extensions/_scope.dart';
import 'package:state_tests/common/models/note/base_notes_view_model.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

class NotesJune extends JuneState implements BaseNotesViewModel {
  NotesState _state;

  @override
  NotesState get state => _state;

  NotesJune([this._state = const NotesState()]);

  @override
  void addNote() => June.getState(() => NotesJune()).let((it) {
    it._state = it.state.addNote();
    it.setState();
  });

  @override
  void updateInput(String input) => June.getState(() => NotesJune()).let((it) {
    it._state = it.state.updateInput(input);
    it.setState();
  });
}
