import 'package:mobx/mobx.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

import '../../../common/models/note/notes_state_view_model.dart';

part 'notes_store_x.g.dart';

class NotesStoreX = NotesStoreXBase with _$NotesStoreX;

abstract class NotesStoreXBase with Store implements NotesStateFunctions {
  @observable
  NotesState state;

  NotesStoreXBase([this.state = const NotesState()]);

  @action
  @override
  void updateInput(String input) => state.updateInput(input);

  @action
  @override
  void addNote() => state.addNote();
}
