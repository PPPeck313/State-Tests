import 'package:get/get.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesController extends GetxController {

  //============================================================================
  // Fields
  //============================================================================

  Rx<NotesState> state;

  //============================================================================
  // Constructors
  //============================================================================

  NotesController() {
    state = NotesState.initial().obs;
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => state.value = state.value.addNoteNew();

  void updateInput(String input) => state.value = state.value.updateInputNew(input);
}