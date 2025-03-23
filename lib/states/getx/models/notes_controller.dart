import 'package:get/get.dart';
import 'package:state_tests/common/models/note/notes_state_view_model.dart';

import '../../../common/models/note/notes_state.dart';

class NotesController extends GetxController implements NotesStateFunctions {
  Rx<NotesState> state;

  NotesController([NotesState state = const NotesState()]) : state = state.obs;

  @override
  void updateInput(String input) => state.value = state.value.updateInput(input);

  @override
  void addNote() => state.value = state.value.addNote();
}
