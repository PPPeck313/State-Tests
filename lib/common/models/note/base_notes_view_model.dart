import 'package:state_tests/common/models/reactive_state.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

abstract interface class BaseNotesViewModel implements ReactiveViewModel {
  @override
  NotesState get state;

  void updateInput(String input);
  void addNote();
}
