import 'package:mobx/mobx.dart';

part 'NotesStoreX.g.dart';

class NotesStoreX = NotesStoreXBase with _$NotesStoreX;

abstract class NotesStoreXBase with Store {

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