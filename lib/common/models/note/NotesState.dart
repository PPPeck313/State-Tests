import 'package:equatable/equatable.dart';
import 'ListExtensions.dart';

//needs to be a new object for Binder, Bloc, Cubit, Command, RiverPod
class NotesState extends Equatable {

  //============================================================================
  // Fields
  //============================================================================

  List<String> notes;
  String _input;

  //============================================================================
  // Constructors
  //============================================================================

  NotesState(this.notes, this._input);

  NotesState.initial() : notes = [], _input = '';

  NotesState copyWith({List<String> notes, String input}) {
    return NotesState(notes ?? this.notes, input ?? this._input);
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() {
    addNoteWithInput(_input);
  }

  NotesState addNoteNew() {
    return copyWith(notes: notes.concat(_input), input: '');
  }



  void addNoteWithInput(String input) {
    notes.add(input);
    _input = "";
  }

  NotesState addNoteWithInputNew(String input) {
    return copyWith(notes: notes.concat(input), input: '');
  }



  void updateInput(String input) {
    _input = input;
  }

  NotesState updateInputNew(String input) {
    return copyWith(input: input);
  }

  //============================================================================
  // Equatable Methods
  //============================================================================

  @override
  List<Object> get props => [notes, _input];

  @override
  bool get stringify => true;
}