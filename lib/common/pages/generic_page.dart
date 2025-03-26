import 'package:flutter/material.dart';

import '../models/base_counter_view_model.dart';
import '../models/base_notes_view_model.dart';
import '../models/counter/counter_state.dart';
import '../models/counter/widgets/counter.dart';
import '../models/note/notes_state.dart';
import '../models/note/widgets/notes.dart';

class GenericPage extends StatefulWidget {
  final GenericPageState _statePage;

  const GenericPage(this._statePage, {super.key});

  @override
  GenericPageState createState() => _statePage;
}

abstract class GenericPageState extends State<StatefulWidget> {
  late TextEditingController _controller;

  @protected
  BaseCounterViewModel? get counterViewModel => null;

  @protected
  BaseNotesViewModel? get notesViewModel => null;

  Widget getCounterStateWidget(Widget counter) => counter;
  CounterState getCounterState(BuildContext context) => counterViewModel?.state ?? CounterState();
  void increment(BuildContext context) => counterViewModel?.increment();
  void decrement(BuildContext context) => counterViewModel?.decrement();

  Widget getNotesStateWidget(Widget notes) => notes;
  NotesState getNotesState(BuildContext context) => notesViewModel?.state ?? NotesState();
  void updateInput(BuildContext context, String input) => notesViewModel?.updateInput(input);
  void addNote(BuildContext context) => notesViewModel?.addNote();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
      child: Column(
        children: [
          Counter(getCounterStateWidget, getCounterState, decrement, increment),
          Notes(_controller, getNotesStateWidget, getNotesState, updateInput, addNote),
        ],
      ),
    ),
  );
}
