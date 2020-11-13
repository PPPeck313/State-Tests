import 'package:flutter_riverpod/all.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesNotifier extends StateNotifier<NotesState> {

  //============================================================================
  // Static Fields
  //============================================================================

  static final notesProvider = StateNotifierProvider((ref) => NotesNotifier());

  //============================================================================
  // Constructors
  //============================================================================

  NotesNotifier() : super(NotesState.initial());

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => state = state.addNoteNew();

  void updateInput(String input) => state = state.updateInputNew(input);
}