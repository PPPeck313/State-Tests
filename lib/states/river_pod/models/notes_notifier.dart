import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/note/base_notes_view_model.dart';
import '../../../common/models/note/notes_state.dart';

part 'notes_notifier.g.dart';

@riverpod
class NotesNotifier extends _$NotesNotifier implements BaseNotesViewModel {
  @override
  NotesState build() => NotesState();

  @override
  void addNote() => state = state.addNote();

  @override
  void updateInput(String input) => state = state.updateInput(input);
}
