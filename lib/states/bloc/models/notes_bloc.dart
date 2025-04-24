import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/models/note/base_notes_view_model.dart';
import '../../../common/models/note/notes_event.dart';
import '../../../common/models/note/notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> implements BaseNotesViewModel {
  NotesBloc([super.initialState = const NotesState()]) {
    on<UpdateInputEvent>((event, emit) => emit(state.updateInput(event.input)));
    on<AddNoteEvent>((event, emit) => emit(state.addNote()));
  }

  @protected
  @override
  void updateInput(String input) => add(UpdateInputEvent(input));

  @protected
  @override
  void addNote() => add(AddNoteEvent());
}
