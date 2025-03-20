import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/note/NotesEvent.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesState());

  @override
  void onEvent(NotesEvent event) {
    super.onEvent(event);

    switch (event) {
      case AddNoteEvent():
        state.addNoteNew();
      case UpdateInputEvent():
        state.updateInputNew(event.input);
    }
  }
}
