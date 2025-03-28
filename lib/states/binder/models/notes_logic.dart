import 'package:binder/binder.dart';

import '../../../common/models/base_notes_view_model.dart';
import '../../../common/models/note/notes_state.dart';

class NotesLogicController {
  final LogicRef logicRef;
  final StateRef<NotesState> stateRef;

  NotesLogicController([NotesState state = const NotesState()]) : this._internal(StateRef<NotesState>(state));

  NotesLogicController._internal(this.stateRef) : logicRef = LogicRef((scope) => NotesLogic(scope, stateRef));
}

class NotesLogic extends BaseNotesViewModel with Logic {
  @override
  NotesState get state => read(stateRef);

  @override
  final Scope scope;

  final StateRef<NotesState> stateRef;

  NotesLogic(this.scope, this.stateRef);

  @override
  void updateInput(String input) => write(stateRef, state.updateInput(input));

  @override
  void addNote() => write(stateRef, state.addNote());
}
