import 'package:state_tests/common/models/note/NotesState.dart';

class NotesReactiveModel {

  //============================================================================
  // Fields
  //============================================================================

  NotesState state;

  //============================================================================
  // Constructors
  //============================================================================

  NotesReactiveModel() {
    state = NotesState.initial();
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => state.addNote();

  void updateInput(String input) => state.updateInput(input);
}