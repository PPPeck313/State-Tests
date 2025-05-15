import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/states/notes_view_model.dart';

part 'notes_store_x.g.dart';

class NotesStoreX = NotesStoreXBase with _$NotesStoreX;

abstract class NotesStoreXBase with Store, NotesViewModelBehavior {
  @protected
  @observable
  @override
  NotesState state;

  NotesStoreXBase([this.state = const NotesState()]);
}
