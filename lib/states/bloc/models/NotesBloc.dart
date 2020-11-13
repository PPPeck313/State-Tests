import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/note/NotesActions.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

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
      yield state.addNoteNew();
    }

    else if (event is UpdateInputAction) {
      yield state.updateInputNew(event.input);
    }
  }
}
