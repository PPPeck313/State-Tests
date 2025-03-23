import 'package:flutter/material.dart';

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
  final TextEditingController _controller = TextEditingController();

  Widget? getCounterWidget(Widget child) => null;
  CounterState getCounterState(BuildContext context);
  void increment(BuildContext context);
  void decrement(BuildContext context);

  Widget? getNotesWidget(Widget child) => null;
  NotesState getNotesState(BuildContext context);
  void addNote(BuildContext context);
  void updateInput(BuildContext context, String input);

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
          getNotesWidget(makeNotesList(context)) ?? makeNotesList(context),
        ],
      ),
    ),
  );

  Widget makeCounter() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [makeSubtractButton(), getCounterWidget(makeCounterText()) ?? makeCounterText(), makeAddButton()],
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
