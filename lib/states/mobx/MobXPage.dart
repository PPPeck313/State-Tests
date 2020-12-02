import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/CounterStoreX.dart';
import 'models/NotesStoreX.dart';

class MobXPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Fields
  //============================================================================

  CounterStoreX _counterStoreX = CounterStoreXWrapper().counterStoreX;
  NotesStoreX _notesStoreX = NotesStoreXWrapper().notesStoreX;

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return GenericPage(this);
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "MobX";



  @override
  Widget getCounterText(BuildContext context) => Observer(builder: (_) => Text('${_counterStoreX.count}', style: new TextStyle(fontSize: 60.0)));

  @override
  void decrement(BuildContext context) => _counterStoreX.decrement();

  @override
  void increment(BuildContext context) => _counterStoreX.increment();



  @override
  Widget getNotesList(BuildContext context) => NotesList.mobX(_notesStoreX);// Use Observer to subscribe to updates to the NotesStore.

  @override
  void addNote(BuildContext context) => _notesStoreX.addNote();

  @override
  void updateInput(BuildContext context, String input) => _notesStoreX.updateInput(input);
}