import 'package:flutter/material.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesList.dart';
import 'package:state_tests/common/models/note/NotesState.dart';

class GenericPage extends StatefulWidget {

  //============================================================================
  // Fields
  //============================================================================

  final GenericPageState statePage;

  //============================================================================
  // Constructors
  //============================================================================

  const GenericPage(this.statePage, {super.key});

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  GenericPageState createState() => statePage;
}

abstract class GenericPageState extends State<StatefulWidget> {

  //============================================================================
  // Fields
  //============================================================================

  final TextEditingController _controller = TextEditingController();

  //============================================================================
  // Abstract Methods
  //============================================================================

  String getTag();

  CounterState getCounterState(BuildContext context);
  void increment(BuildContext context);
  void decrement(BuildContext context);

  NotesState getNotesState(BuildContext context);
  void addNote(BuildContext context);
  void updateInput(BuildContext context, String input);

  //============================================================================
  // Lifecycle Methods
  //============================================================================

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
          NotesList(getNotesState(context))
        ],
      ),
    ),
  );

  //============================================================================
  // Widget Methods
  //============================================================================

  Widget makeCounter() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      makeSubtractButton(),
      makeCounterText(),
      makeAddButton()
    ],
  );

  Widget makeSubtractButton() => FloatingActionButton(
    onPressed: () { decrement(context); },
    child: Icon(Icons.remove, color: Colors.black),
    backgroundColor: Colors.white
  );

  Widget makeCounterText() => Text(
    '${getCounterState(context).count}',
    style: new TextStyle(fontSize: 60.0)
  );

  Widget makeAddButton() => FloatingActionButton(
    onPressed: () { increment(context); },
    child: Icon(Icons.add, color: Colors.black),
    backgroundColor: Colors.white
  );



  Widget makeCreateNoteButton() => Padding(
    padding: const EdgeInsets.only(top: 32.0),
    child: TextButton(
      onPressed: () {
        addNote(context);
        _controller.clear();
      }, 
      child: Text('Create Note')
    ),
  );

  Widget makeUpdateInputTextField() => TextField(
    controller: _controller,
    onChanged: (value) => { updateInput(context, value) },
    decoration: InputDecoration.collapsed(hintText: 'Add a note'),
  );
}