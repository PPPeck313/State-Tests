import 'package:get/get.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesController extends GetxController {
  static final NotesController _instance = NotesController._new();

  factory NotesController() => _instance;

  Rx<NotesState> state;
  RxList notes;
  RxString input;

  NotesController._new() {
    state = NotesState.initial().obs;
    notes = state.value.notes.obs;
    input = state.value.input.obs;
  }

  void addNote() => state.value = state.value.addNoteNew();

  void updateInput(String input) => state.value = state.value.updateInputNew(input);
}
