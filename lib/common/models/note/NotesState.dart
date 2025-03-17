import 'package:dart_mappable/dart_mappable.dart';

part 'NotesState.mapper.dart';

//needs to be a new object for Binder, Bloc, Cubit, Command, RiverPod
@MappableClass()
class NotesState with NotesStateMappable {

  //============================================================================
  // Fields
  //============================================================================

  final List<String> notes = [];
  String input;

  //============================================================================
  // Constructors
  //============================================================================

  NotesState({this.input = ''});

  //============================================================================
  // Instance Methods
  //============================================================================

  void addNote() {
    notes.add(input);
    this.input = '';
  }

  NotesState addNoteNew() {
    notes.add(input);
    return copyWith(input: '');
  }

  void updateInput(String input) => this.input = input;
  NotesState updateInputNew(String input) => copyWith(input: input);
}