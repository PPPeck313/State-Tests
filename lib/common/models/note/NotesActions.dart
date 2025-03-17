sealed class NotesActions {}

class AddNoteAction extends NotesActions {}

class UpdateInputAction extends NotesActions {

  //============================================================================
  // Fields
  //============================================================================

  String input;

  //============================================================================
  // Constructors
  //============================================================================

  UpdateInputAction(this.input);
}
