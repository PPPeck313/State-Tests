import 'package:binder/binder.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/ListExtension.dart';

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
    var state = read(notesRef);
    write(notesRef, state.copyWith(notes: state.notes.concat(state.input), input: ''));
  }

  void updateInput(String input) => write(notesRef, read(notesRef).copyWith(input: input));
}