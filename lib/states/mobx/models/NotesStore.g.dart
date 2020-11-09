// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotesStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotesStore on NotesStoreBase, Store {
  final _$inputAtom = Atom(name: 'NotesStoreBase.input');

  @override
  String get input {
    _$inputAtom.reportRead();
    return super.input;
  }

  @override
  set input(String value) {
    _$inputAtom.reportWrite(value, super.input, () {
      super.input = value;
    });
  }

  final _$notesAtom = Atom(name: 'NotesStoreBase.notes');

  @override
  ObservableList<String> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<String> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  final _$NotesStoreBaseActionController =
      ActionController(name: 'NotesStoreBase');

  @override
  void updateInput(String val) {
    final _$actionInfo = _$NotesStoreBaseActionController.startAction(
        name: 'NotesStoreBase.updateInput');
    try {
      return super.updateInput(val);
    } finally {
      _$NotesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNote() {
    final _$actionInfo = _$NotesStoreBaseActionController.startAction(
        name: 'NotesStoreBase.addNote');
    try {
      return super.addNote();
    } finally {
      _$NotesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
input: ${input},
notes: ${notes}
    ''';
  }
}
