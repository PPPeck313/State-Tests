import 'package:mobx/mobx.dart';

part 'NotesStoreX.g.dart';

class NotesStoreXWrapper {
  static final NotesStoreXWrapper _instance = NotesStoreXWrapper._new(NotesStoreX());

  factory NotesStoreXWrapper() => _instance;

  NotesStoreX notesStoreX;

  NotesStoreXWrapper._new(this.notesStoreX);
}

class NotesStoreX = NotesStoreXBase with _$NotesStoreX;

abstract class NotesStoreXBase with Store {
  @observable
  String input = '';

  @observable
  ObservableList<String> notes = ObservableList();

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
