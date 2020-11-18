import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class NotesCubit extends Cubit<NotesState> {

  //============================================================================
  // Static Fields
  //============================================================================

  static NotesCubit _instance = NotesCubit._new();

  factory NotesCubit() => _instance;

  //============================================================================
  // Constructors
  //============================================================================

  NotesCubit._new() : super(NotesState.initial());

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => emit(state.addNoteNew());

  void updateInput(String input) => emit(state.updateInputNew(input));
}