import 'package:binder/binder.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesLogic with Logic {

  //============================================================================
  // Static Fields
  //============================================================================

  //BinderScope disposes values when out of scope, but can jumpstart value on recreation with override
  static NotesState notesState = NotesState.initial();

  static final StateRef<NotesState> notesRef = StateRef(NotesState.initial());
  static final LogicRef<NotesLogic> notesLogicRef = LogicRef((scope) => NotesLogic(scope));

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