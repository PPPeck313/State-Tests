sealed class NotesEvent {}

final class AddNoteEvent extends NotesEvent {}

final class UpdateInputEvent extends NotesEvent {
  String input;

  UpdateInputEvent(this.input);
}
