import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesState());

  void addNote() => emit(state.addNoteNew());
  void updateInput(String input) => emit(state.updateInputNew(input));
}
