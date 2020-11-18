import 'package:flutter_riverpod/all.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesNotifier extends StateNotifier<NotesState> {

  //============================================================================
  // Static Fields
  //============================================================================

  static StateNotifierProvider<NotesNotifier> notesProvider = StateNotifierProvider((ref) => NotesNotifier());

  static NotesNotifier _instance = NotesNotifier._new();

  factory NotesNotifier() => _instance;

  //============================================================================
  // Constructors
  //============================================================================

  NotesNotifier._new() : super(NotesState.initial());

  //============================================================================
  // StateNotifier Methods
  //============================================================================

  //To listen for entire app open without putting at root
  @override
  void dispose() {}

  void manualDispose() {
    super.dispose();
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => state = state.addNoteNew();

  void updateInput(String input) => state = state.updateInputNew(input);
}