import 'note/notes_state.dart';

abstract class BaseNotesViewModel {
  NotesState get state;

  void updateInput(String input);
  void addNote();
}
