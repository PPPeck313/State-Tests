import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/states/notes_view_model.dart';

part 'notes_notifier.g.dart';

@riverpod
class NotesNotifier extends _$NotesNotifier with NotesViewModelBehavior {
  @override
  NotesState build() => NotesState();
}
