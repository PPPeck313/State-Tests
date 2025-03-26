import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import '../../../common/models/base_notes_view_model.dart';
import '../../../common/models/note/notes_event.dart';
import '../../../common/models/note/notes_state.dart';

class NotesStore implements BaseNotesViewModel {
  Store<NotesState> store;

  @override
  NotesState get state => store.state;

  NotesStore([NotesState state = const NotesState()])
    : store = Store<NotesState>(
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
  NotesState updateInput(String input) => store.dispatch(UpdateInputEvent(input));

  @override
  NotesState addNote() => store.dispatch(AddNoteEvent());
}
