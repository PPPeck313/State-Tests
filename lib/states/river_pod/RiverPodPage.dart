import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/CounterNotifier.dart';
import 'models/NotesNotifier.dart';

class RiverPodPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: GenericPage(this)
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Riverpod";



  @override
  Widget getCounterText(BuildContext context) {
    return Consumer(
        builder: (context, watch, child) {
          CounterState state = watch(CounterNotifier.counterProvider.state);
          return Text('${state.count}', style: new TextStyle(fontSize: 60.0));
        }
    );
  }

  @override
  void decrement(BuildContext context) {
    CounterNotifier counterNotifier = context.read(CounterNotifier.counterProvider);
    counterNotifier.decrement();
  }

  @override
  void increment(BuildContext context) {
    CounterNotifier counterNotifier = context.read(CounterNotifier.counterProvider);
    counterNotifier.increment();
  }



  @override
  Widget getNotesList(BuildContext context) {
    return Consumer(
        builder: (context, watch, child) {
          NotesState state = watch(NotesNotifier.notesProvider.state);
          return NotesList(state);
        }
    );
  } // Subscribe to the NotesController's state

  @override
  void addNote(BuildContext context) {
    NotesNotifier notesNotifier = context.read(NotesNotifier.notesProvider);
    notesNotifier.addNote();
  }

  @override
  void updateInput(BuildContext context, String input) {
    NotesNotifier notesNotifier = context.read(NotesNotifier.notesProvider);
    notesNotifier.updateInput(input);
  }
}