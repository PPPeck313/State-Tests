import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesCubit extends Cubit<NotesState> {

  //============================================================================
  // Constructors
  //============================================================================

  NotesCubit() : super(NotesState());

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => emit(state.addNoteNew());
  void updateInput(String input) => emit(state.updateInputNew(input));
}