import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/ListExtension.dart';

import '../../../common/models/NotesActions.dart';

class NotesStore extends Store<NotesState> {

  //============================================================================
  // Constructors
  //===========================================================================

  NotesStore() : super((NotesState state, dynamic action) {
    if (action is AddNoteAction) {
      return state.copyWith(notes: state.notes.concat(state.input), input: '');
    }

    else if (action is UpdateInputAction) {
      return state.copyWith(input: action.input);
    }

    return state;
  }, initialState: NotesState.initial(),
      middleware: [LoggingMiddleware.printer()]);
}