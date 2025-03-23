import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/counter_store_x.dart';
import 'models/notes_store_x.dart';

class MobXPage extends GenericPageState {
  final CounterStoreX _counterStoreX;
  final NotesStoreX _notesStoreX;

  MobXPage() : _counterStoreX = CounterStoreX(), _notesStoreX = NotesStoreX();

  @override
  Widget? getCounterWidget(Widget child) => Observer(builder: (_) => child);

  @override
  CounterState getCounterState(BuildContext _) => _counterStoreX.state;

  @override
  void decrement(BuildContext _) => _counterStoreX.decrement();

  @override
  void increment(BuildContext _) => _counterStoreX.increment();

  @override
  Widget? getNotesWidget(Widget child) => Observer(builder: (_) => child);

  @override
  NotesState getNotesState(BuildContext _) => _notesStoreX.state;

  @override
  void addNote(BuildContext _) => _notesStoreX.addNote();

  @override
  void updateInput(BuildContext _, String input) => _notesStoreX.updateInput(input);
}
