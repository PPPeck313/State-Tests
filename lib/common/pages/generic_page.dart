import 'package:flutter/material.dart';

import '../models/base_counter_view_model.dart';
import '../models/base_notes_view_model.dart';
import '../models/counter/counter_state.dart';
import '../models/note/notes_state.dart';
import '../models/note/widgets/notes_list.dart';

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

  Widget getCounterWidget(Widget child) => child;
  CounterState getCounterState(BuildContext context) => counterViewModel?.state ?? CounterState();
  void increment(BuildContext context) => counterViewModel?.increment();
  void decrement(BuildContext context) => counterViewModel?.decrement();

  Widget getNotesWidget(Widget child) => child;
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
          makeCounter(),
          makeCreateNoteButton(),
          makeUpdateInputTextField(),
          Divider(),
          getNotesWidget(makeNotesList(context)),
        ],
      ),
    ),
  );

  Widget makeCounter() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [makeSubtractButton(), getCounterWidget(makeCounterText()), makeAddButton()],
  );

  Widget makeSubtractButton() => FloatingActionButton(
    onPressed: () {
      decrement(context);
    },
    backgroundColor: Colors.white,
    child: Icon(Icons.remove, color: Colors.black),
  );

  Widget makeCounterText() => Text('${getCounterState(context).count}', style: TextStyle(fontSize: 60.0));

  Widget makeAddButton() => FloatingActionButton(
    onPressed: () {
      increment(context);
    },
    backgroundColor: Colors.white,
    child: Icon(Icons.add, color: Colors.black),
  );

  Widget makeCreateNoteButton() => Padding(
    padding: const EdgeInsets.only(top: 32.0),
    child: TextButton(
      onPressed: () {
        addNote(context);
        _controller.clear();
      },
      child: Text('Create Note'),
    ),
  );

  Widget makeUpdateInputTextField() => TextField(
    controller: _controller,
    onChanged: (value) => {updateInput(context, value)},
    decoration: InputDecoration.collapsed(hintText: 'Add a note'),
  );

  Widget makeNotesList(BuildContext context) => NotesList(getNotesState(context));
}
