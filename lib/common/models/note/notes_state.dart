import 'package:dart_mappable/dart_mappable.dart';

import '../reactive_state.dart';

part 'notes_state.mapper.dart';

@MappableClass()
final class NotesState with NotesStateMappable implements ReactiveState {
  final List<String> notes;
  final String input;

  const NotesState({this.notes = const [], this.input = ''});
}

extension NotesStateExtensions on NotesState {
  NotesState updateInput(String input) => copyWith(input: input);
  NotesState addNote() => input.isNotEmpty ? copyWith(notes: [...notes, input], input: '') : this;
}
