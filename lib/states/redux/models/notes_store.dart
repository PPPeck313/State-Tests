import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import '../../../common/models/note/notes_event.dart';
import '../../../common/models/note/notes_state.dart';
import '../../../common/models/note/notes_view_model.dart';

class NotesStore implements BaseNotesViewModel {
  late Store<NotesState> store; // can initialize in Store super constructor, but can't use instance methods

  @override
  NotesState get state => store.state;

  NotesStore([NotesState state = const NotesState()]) {
    store = Store<NotesState>(
      (NotesState state, dynamic action) => switch (action) {
        UpdateInputEvent _ => updateInput(action.input),
        AddNoteEvent _ => addNote(),
        Object _ => throw UnimplementedError(),
        null => throw UnimplementedError(),
      },
      initialState: state,
      middleware: [LoggingMiddleware().call],
    );
  }

  @override
  NotesState updateInput(String input) => state.updateInput(input);

  @override
  NotesState addNote() => state.addNote();
}
