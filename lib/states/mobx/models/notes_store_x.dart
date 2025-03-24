import 'package:mobx/mobx.dart';

import '../../../common/models/note/notes_state.dart';
import '../../../common/models/note/notes_view_model.dart';

part 'notes_store_x.g.dart';

class NotesStoreX = NotesStoreXBase with _$NotesStoreX;

abstract class NotesStoreXBase with Store implements BaseNotesViewModel {
  @observable
  @override
  NotesState state;

  NotesStoreXBase([this.state = const NotesState()]);

  @action
  @override
  void updateInput(String input) => state = state.updateInput(input);

  @action
  @override
  void addNote() => state = state.addNote();
}
