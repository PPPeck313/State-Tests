// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CounterStoreX.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStoreX on CounterStoreXBase, Store {
  final _$countAtom = Atom(name: 'CounterStoreXBase.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$CounterStoreXBaseActionController =
      ActionController(name: 'CounterStoreXBase');

  @override
  void decrement() {
    final _$actionInfo = _$CounterStoreXBaseActionController.startAction(
        name: 'CounterStoreXBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$CounterStoreXBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$CounterStoreXBaseActionController.startAction(
        name: 'CounterStoreXBase.increment');
    try {
      return super.increment();
    } finally {
      _$CounterStoreXBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
