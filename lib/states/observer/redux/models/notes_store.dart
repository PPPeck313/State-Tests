import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:state_tests/common/models/note/base_notes_view_model.dart';
import 'package:state_tests/common/models/note/notes_event.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

class NotesStore extends Store<NotesState> implements BaseNotesViewModel {
  NotesStore([NotesState state = const NotesState()])
    : super(
        (NotesState state, dynamic action) => switch (action) {
          UpdateInputEvent _ => state.updateInput(action.input),
          AddNoteEvent _ => state.addNote(),
          Object _ => throw UnimplementedError(),
          null => throw UnimplementedError(),
        },
        initialState: state,
        middleware: [LoggingMiddleware().call],
      );

  @override
  NotesState updateInput(String input) => dispatch(UpdateInputEvent(input));

  @override
  NotesState addNote() => dispatch(AddNoteEvent());
}
