import 'package:get/get.dart';

import '../../../common/models/base_notes_view_model.dart';
import '../../../common/models/note/notes_state.dart';

class NotesController extends GetxController implements BaseNotesViewModel {
  final Rx<NotesState> xState;

  @override
  NotesState get state => xState.value;

  NotesController([NotesState state = const NotesState()]) : xState = state.obs;

  @override
  void updateInput(String input) => xState.value = state.updateInput(input);

  @override
  void addNote() => xState.value = state.addNote();
}
