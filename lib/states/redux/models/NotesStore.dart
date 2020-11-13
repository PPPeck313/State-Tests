import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:state_tests/common/models/note/NotesActions.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesStore extends Store<NotesState> {

  //============================================================================
  // Constructors
  //===========================================================================

  NotesStore() : super((NotesState state, dynamic action) {
    if (action is AddNoteAction) {
      return state.addNoteNew();
    }

    else if (action is UpdateInputAction) {
      return state.updateInputNew(action.input);
    }

    return state;
  }, initialState: NotesState.initial(),
      middleware: [LoggingMiddleware.printer()]);
}