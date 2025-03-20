sealed class NotesEvent {}

class AddNoteEvent extends NotesEvent {}

class UpdateInputEvent extends NotesEvent {
  //============================================================================
  // Fields
  //============================================================================

  String input;

  //============================================================================
  // Constructors
  //============================================================================

  UpdateInputEvent(this.input);
}
