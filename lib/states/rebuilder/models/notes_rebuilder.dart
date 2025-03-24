import 'package:states_rebuilder/scr/state_management/rm.dart';

import '../../../common/models/note/notes_state.dart';
import '../../../common/models/note/notes_view_model.dart';

class NotesRebuilder implements BaseNotesViewModel {
  final Injected<NotesState> injectedState;

  @override
  NotesState get state => injectedState.state;

  NotesRebuilder([NotesState state = const NotesState()]) : injectedState = RM.inject<NotesState>(() => state);

  @override
  void updateInput(String input) => injectedState.state = state.updateInput(input);

  @override
  void addNote() => injectedState.state = state.addNote();
}
