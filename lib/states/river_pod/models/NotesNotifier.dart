import 'package:flutter_riverpod/all.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/ListExtension.dart';

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

  void addNote() {
    var notes = state.notes.concat(state.input);
    state = state.copyWith(notes: notes, input: '');
  }

  void updateInput(String input) => state = state.copyWith(input: input);
}