sealed class NotesEvent {}

class AddNoteEvent extends NotesEvent {}

class UpdateInputEvent extends NotesEvent {
  String input;

  UpdateInputEvent(this.input);
}
