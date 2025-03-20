import 'package:state_tests/common/models/note/NotesState.dart';

class NotesReactiveModel {
  static final NotesReactiveModel _instance = NotesReactiveModel._new(NotesState.initial());

  factory NotesReactiveModel() => _instance;

  NotesState state;

  NotesReactiveModel._new(this.state);

  void addNote() => state.addNote();

  void updateInput(String input) => state.updateInput(input);
}
