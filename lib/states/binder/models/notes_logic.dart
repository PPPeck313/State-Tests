import 'package:binder/binder.dart';
import 'package:state_tests/common/models/note/notes_state_view_model.dart';

import '../../../common/models/note/notes_state.dart';

class NotesLogic extends NotesStateViewModel with Logic {
  @override
  final Scope scope;
  late StateRef<NotesState> notesStateRef;

  factory NotesLogic(Scope scope, [NotesState state = const NotesState()]) {
    StateRef<NotesState> notesStateRef = StateRef<NotesState>(state);
    return NotesLogic._internal(scope, notesStateRef);
  }

  NotesLogic._internal(this.scope, this.notesStateRef) : super(scope.read(notesStateRef, null));

  @override
  void updateInput(String input) => write(notesStateRef, state.updateInput(input));

  @override
  void addNote() => write(notesStateRef, state.addNote());
}
