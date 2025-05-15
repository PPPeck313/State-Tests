import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/states/notes_view_model.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class NotesRebuilder with NotesViewModelBehavior {
  final Injected<NotesState> _injectedState;

  @override
  NotesState get state => _injectedState.state;

  @override
  set state(NotesState value) => _injectedState.state = value;

  NotesRebuilder([NotesState state = const NotesState()]) : _injectedState = RM.inject<NotesState>(() => state);
}
