import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/pages/StatePage.dart';

class GenericPage extends StatefulWidget {

  //============================================================================
  // Fields
  //============================================================================

  final StatePage statePage;

  //============================================================================
  // Constructors
  //============================================================================

  const GenericPage(this.statePage, {Key key}) : super(key: key);

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  _GenericPageState createState() => _GenericPageState(statePage);
}



class _GenericPageState extends State<GenericPage> {

  //============================================================================
  // Fields
  //============================================================================

  final StatePage statePage;

  TextEditingController _controller;

  //============================================================================
  // Constructors
  //============================================================================

  _GenericPageState(this.statePage);

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(statePage.getTag())),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
        child: Column(
          children: [
            makeCounter(),
            makeCreateNoteButton(),
            makeUpdateInputTextField(),
            Divider(),
            statePage.getNotesList(context)
          ],
        ),
      ),
    );
  }

  //============================================================================
  // Widget Methods
  //============================================================================

  Widget makeCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        makeSubtractButton(),
        statePage.getCounterText(context),
        makeAddButton()
      ],
    );
  }

  Widget makeSubtractButton() {
    return FloatingActionButton(
        onPressed: () {
          statePage.decrement(context);
        },
        child: Icon(Icons.remove, color: Colors.black),
        backgroundColor: Colors.white
    );
  }

  Widget makeAddButton() {
    return FloatingActionButton(
        onPressed: () {
          statePage.increment(context);
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.white
    );
  }



  Widget makeCreateNoteButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: FlatButton(
          onPressed: () {
            statePage.addNote(context);
            _controller.clear();
          },
          child: Text('Create Note')
      ),
    );
  }

  Widget makeUpdateInputTextField() {
    return TextField(
      controller: _controller,
      onChanged: (value) => {
        statePage.updateInput(context, value)
      },
      decoration: InputDecoration.collapsed(hintText: 'Add a note'),
    );
  }
}