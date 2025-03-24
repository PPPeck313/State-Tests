import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/models/note/notes_event.dart';
import '../../../common/models/note/notes_state.dart';
import '../../../common/models/note/notes_view_model.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> implements BaseNotesViewModel {
  NotesBloc([super.initialState = const NotesState()]) {
    on<UpdateInputEvent>((event, emit) => emit(updateInput(event.input)));
    on<AddNoteEvent>((event, emit) => emit(addNote()));
  }

  @protected
  @override
  NotesState updateInput(String input) => state.updateInput(input);

  @protected
  @override
  NotesState addNote() => state.addNote();
}
