import 'package:get/get.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesController extends GetxController {

  //============================================================================
  // Static Fields
  //============================================================================

  static NotesController _instance = NotesController._new();

  factory NotesController() => _instance;

  //============================================================================
  // Fields
  //============================================================================

  Rx<NotesState> state;
  RxList notes;
  RxString input;

  //============================================================================
  // Constructors
  //============================================================================

  NotesController._new() {
    state = NotesState.initial().obs;
    notes = state.value.notes.obs;
    input = state.value.input.obs;
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => state.value = state.value.addNoteNew();

  void updateInput(String input) => state.value = state.value.updateInputNew(input);
}