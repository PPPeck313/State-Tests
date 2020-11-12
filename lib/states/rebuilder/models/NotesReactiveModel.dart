import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/ListExtension.dart';

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

  void addNote() {
    var notes = state.notes.concat(state.input);
    state = state.copyWith(notes: notes, input: '');
  }

  void updateInput(String input) => state = state.copyWith(input: input);
}