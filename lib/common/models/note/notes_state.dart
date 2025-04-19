import 'package:dart_mappable/dart_mappable.dart';

part 'notes_state.mapper.dart';

@MappableClass()
final class NotesState with NotesStateMappable {
  final List<String> notes = const [];
  final String input;

  const NotesState({this.input = ''});
}

extension NotesStateExtensions on NotesState {
  NotesState updateInput(String input) => copyWith(input: input);

  NotesState addNote() {
    notes.add(input);
    return copyWith(input: '');
  }
}
