import 'package:equatable/equatable.dart';
import 'ListExtensions.dart';

//needs to be a new object for Binder, Bloc, Cubit, Command, RiverPod
class NotesState extends Equatable {

  //============================================================================
  // Fields
  //============================================================================

  List<String> notes;
  String input;

  //============================================================================
  // Constructors
  //============================================================================

  NotesState(this.notes, this.input);

  NotesState.initial() : notes = [], input = '';

  NotesState copyWith({List<String> notes, String input}) {
    return NotesState(notes ?? this.notes, input ?? this.input);
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() {
    addNoteWithInput(input);
  }

  NotesState addNoteNew() {
    return copyWith(notes: notes.concat(input), input: '');
  }



  void addNoteWithInput(String input) {
    notes.add(input);
    input = "";
  }

  NotesState addNoteWithInputNew(String input) {
    return copyWith(notes: notes.concat(input), input: '');
  }



  void updateInput(String input) {
    this.input = input;
  }

  NotesState updateInputNew(String input) {
    return copyWith(input: input);
  }

  //============================================================================
  // Equatable Methods
  //============================================================================

  @override
  List<Object> get props => [notes, input];

  @override
  bool get stringify => true;
}