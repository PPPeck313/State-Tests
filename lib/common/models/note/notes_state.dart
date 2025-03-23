import 'package:dart_mappable/dart_mappable.dart';

part 'notes_state.mapper.dart';

@MappableClass()
class NotesState with NotesStateMappable {
  final List<String> notes = const [];
  final String input;

  const NotesState({this.input = ''});
}
