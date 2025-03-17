import 'package:binder/binder.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

final StateRef<NotesState> notesRef = StateRef(NotesState());
final LogicRef<NotesLogic> notesLogicRef = LogicRef((scope) => NotesLogic(scope));

class NotesLogic with Logic {

  //============================================================================
  // Constructors
  //============================================================================

  const NotesLogic(this.scope);

  //============================================================================
  // Logic Methods
  //============================================================================

  @override
  final Scope scope;

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => write(notesRef, read(notesRef).addNoteNew());
  void updateInput(String input) => write(notesRef, read(notesRef).updateInputNew(input));
}