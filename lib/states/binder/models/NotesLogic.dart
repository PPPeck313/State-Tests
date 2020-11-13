import 'package:binder/binder.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesLogic with Logic {

  //============================================================================
  // Static Fields
  //============================================================================

  static final notesRef = StateRef(NotesState.initial());
  static final notesLogicRef = LogicRef((scope) => NotesLogic(scope));

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

  void addNote() {
    NotesState state = read(notesRef).addNoteNew();
    write(notesRef, state);
  }

  void updateInput(String input) {
    NotesState state = read(notesRef).updateInputNew(input);
    write(notesRef, state);
  }
}