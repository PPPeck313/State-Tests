import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/note/notes_state_view_model.dart';

import '../../../common/models/note/notes_state.dart';

class NotesCubit extends Cubit<NotesState> implements NotesStateFunctions {
  NotesCubit([super.initialState = const NotesState()]);

  @override
  void updateInput(String input) => emit(state.updateInput(input));

  @override
  void addNote() => emit(state.addNote());
}
