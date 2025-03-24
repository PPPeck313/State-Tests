import 'package:binder/binder.dart';

import '../../../common/models/note/notes_state.dart';
import '../../../common/models/note/notes_view_model.dart';

class NotesLogic extends BaseNotesViewModel with Logic {
  @override
  NotesState get state => read(notesStateRef);

  @override
  final Scope scope;

  StateRef<NotesState> notesStateRef;

  NotesLogic(this.scope, [NotesState state = const NotesState()]) : notesStateRef = StateRef<NotesState>(state);

  @override
  void updateInput(String input) => write(notesStateRef, state.updateInput(input));

  @override
  void addNote() => write(notesStateRef, state.addNote());
}
