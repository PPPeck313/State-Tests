import 'package:bloc/bloc.dart';

import '../../../common/models/base_notes_view_model.dart';
import '../../../common/models/note/notes_state.dart';

class NotesCubit extends Cubit<NotesState> implements BaseNotesViewModel {
  NotesCubit([super.initialState = const NotesState()]);

  @override
  void updateInput(String input) => emit(state.updateInput(input));

  @override
  void addNote() => emit(state.addNote());
}
