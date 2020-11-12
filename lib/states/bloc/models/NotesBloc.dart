import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/NotesActions.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/ListExtension.dart';

class NotesBloc extends Bloc<NotesActions, NotesState> {

  //============================================================================
  // Constructors
  //============================================================================

  NotesBloc() : super(NotesState.initial());

  //============================================================================
  // Bloc Methods
  //============================================================================

  @override
  NotesState get initialState => NotesState.initial();

  @override
  Stream<NotesState> mapEventToState(NotesActions event) async* {
    if (event is AddNoteAction) {
      yield state.copyWith(notes: state.notes.concat(state.input), input: '');
    }

    else if (event is UpdateInputAction) {
      yield state.copyWith(input: event.input);
    }
  }
}
