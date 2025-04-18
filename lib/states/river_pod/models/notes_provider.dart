import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/base_notes_view_model.dart';
import '../../../common/models/note/notes_state.dart';

part 'notes_provider.g.dart';

@riverpod
class NotesProvider extends _$NotesProvider implements BaseNotesViewModel {
  final Provider<NotesState> provider;

  NotesProvider([NotesState state = const NotesState()]) : provider = Provider((ref) => state) {
    this.state = state;
  }

  @override
  NotesState build() => state;

  @override
  void addNote() => state = state.addNote();

  @override
  void updateInput(String input) => state = state.updateInput(input);
}
