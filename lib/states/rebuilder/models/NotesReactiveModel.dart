import 'package:state_tests/common/models/note/NotesState.dart';

class NotesReactiveModel {

  //============================================================================
  // Static Fields
  //============================================================================

  static NotesReactiveModel _instance = NotesReactiveModel._new(NotesState.initial());

  factory NotesReactiveModel() => _instance;

  //============================================================================
  // Fields
  //============================================================================

  NotesState state;

  //============================================================================
  // Constructors
  //============================================================================

  NotesReactiveModel._new(this.state);

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => state.addNote();

  void updateInput(String input) => state.updateInput(input);
}