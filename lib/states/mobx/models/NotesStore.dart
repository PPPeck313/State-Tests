import 'package:mobx/mobx.dart';

part 'NotesStore.g.dart';

class NotesStore = NotesStoreBase with _$NotesStore;

abstract class NotesStoreBase with Store {

  //============================================================================
  // Fields
  //============================================================================

  @observable
  String input = '';

  @observable
  ObservableList<String> notes = ObservableList();

  //============================================================================
  // Instance Methods
  //============================================================================

  @action
  void updateInput(String val) {
    input = val;
  }

  @action
  void addNote() {
    notes.add(input);
    input = '';
  }
}