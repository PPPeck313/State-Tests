import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesStore extends Store<NotesState> {
  static final NotesStore _instance = NotesStore._new();

  factory NotesStore() => _instance;

  NotesStore._new()
      : super(
          (NotesState state, dynamic action) {
            if (action is AddNoteAction) {
              state.addNote();
            } else if (action is UpdateInputAction) {
              state.updateInput(action.input);
            }

            return state;
          },
          initialState: NotesState.initial(),
          middleware: [LoggingMiddleware.printer().call],
        );
}
