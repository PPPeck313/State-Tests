import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_tests/common/models/note/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/CounterStoreX.dart';
import 'models/NotesStoreX.dart';

class MobXPage extends StatelessWidget implements StatePage {
  const MobXPage({super.key});

  final CounterStoreX _counterStoreX = CounterStoreXWrapper().counterStoreX;
  final NotesStoreX _notesStoreX = NotesStoreXWrapper().notesStoreX;

  @override
  Widget build(BuildContext context) => GenericPage(this);

  @override
  String getTag() => 'MobX';

  @override
  Widget getCounterText(BuildContext context) => Observer(
        builder: (_) => Text('${_counterStoreX.count}', style: TextStyle(fontSize: 60.0)),
      );

  @override
  void decrement(BuildContext context) => _counterStoreX.decrement();

  @override
  void increment(BuildContext context) => _counterStoreX.increment();

  @override
  Widget getNotesList(BuildContext context) => NotesList.mobX(
        _notesStoreX,
      ); // Use Observer to subscribe to updates to the NotesStore.

  @override
  void addNote(BuildContext context) => _notesStoreX.addNote();

  @override
  void updateInput(BuildContext context, String input) => _notesStoreX.updateInput(input);
}
