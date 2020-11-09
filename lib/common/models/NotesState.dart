import 'package:equatable/equatable.dart';

class NotesState extends Equatable {

  //============================================================================
  // Fields
  //============================================================================

  final List<String> notes;
  final String input;

  //============================================================================
  // Constructors
  //============================================================================

  NotesState(this.notes, this.input);

  NotesState.initial() : notes = [], input = '';

  NotesState copyWith({List<String> notes, String input,}) {
    return NotesState(notes ?? this.notes, input ?? this.input);
  }

  //============================================================================
  // Equatable Methods
  //============================================================================

  @override
  List<Object> get props => [notes, input];

  @override
  bool get stringify => true;
}