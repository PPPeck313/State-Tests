import 'package:binder/binder.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

final notesRef = StateRef(NotesState());
final notesLogicRef = LogicRef((scope) => NotesLogic(scope));

class NotesLogic with Logic {
  const NotesLogic(this.scope);

  @override
  final Scope scope;

  void addNote() => write(notesRef, read(notesRef).addNoteNew());
  void updateInput(String input) => write(notesRef, read(notesRef).updateInputNew(input));
}
