import '../reactive_state.dart';
import 'notes_state.dart';

abstract interface class BaseNotesViewModel implements ReactiveViewModel {
  NotesState get state;

  void updateInput(String input);
  void addNote();
}
