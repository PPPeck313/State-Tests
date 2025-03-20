import 'package:dart_mappable/dart_mappable.dart';

part 'notes_state.mapper.dart';

//needs to be a new object for Binder, Bloc, Cubit, Command, RiverPod
@MappableClass()
class NotesState with NotesStateMappable {
  final List<String> notes = [];
  String input;

  NotesState({this.input = ''});

  void addNote() {
    notes.add(input);
    input = '';
  }

  NotesState addNoteNew() {
    notes.add(input);
    return copyWith(input: '');
  }

  void updateInput(String input) => this.input = input;
  NotesState updateInputNew(String input) => copyWith(input: input);
}
