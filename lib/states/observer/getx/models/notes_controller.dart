import 'package:get/get.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/states/notes_view_model.dart';

class NotesController extends GetxController with NotesViewModelBehavior {
  final Rx<NotesState> _xState;

  @override
  NotesState get state => _xState.value;

  @override
  set state(NotesState value) => _xState.value = value;

  NotesController([NotesState state = const NotesState()]) : _xState = state.obs;
}
