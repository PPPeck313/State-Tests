import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/ListExtension.dart';

class NotesCubit extends Cubit<NotesState> {

  //============================================================================
  // Constructors
  //============================================================================

  NotesCubit() : super(NotesState.initial());

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() => emit(state.copyWith(notes: state.notes.concat(state.input), input: ''));

  void updateInput(String input) => emit(state.copyWith(input: input));
}