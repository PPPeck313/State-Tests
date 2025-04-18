import 'note/notes_state.dart';

abstract interface class BaseNotesViewModel {
  NotesState get state;

  void updateInput(String input);
  void addNote();
}
