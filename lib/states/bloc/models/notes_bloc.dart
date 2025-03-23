import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/note/notes_state_view_model.dart';

import '../../../common/models/note/notes_event.dart';
import '../../../common/models/note/notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> implements NotesStateFunctions {
  NotesBloc([super.initialState = const NotesState()]) {
    on<UpdateInputEvent>((event, emit) {
      emit(updateInput(event.input));
    });
    on<AddNoteEvent>((event, emit) {
      emit(addNote());
    });
  }

  @override
  NotesState updateInput(String input) => state.updateInput(input);

  @override
  NotesState addNote() => state.addNote();
}
