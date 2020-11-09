import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/Note.dart';
import 'package:state_tests/common/models/NotesState.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            makeCreateNoteButton(),
            makeUpdateInputTextField(),
            Divider(),
            statePage.getList(context)
          ],
        ),
      ),
    );
  }

  //============================================================================
  // Widget Methods
  //============================================================================

  Widget makeCreateNoteButton() {
    return FlatButton(
        onPressed: () {
          statePage.getAddNoteFunction(context);
          _controller.clear();
        },
        child: Text('Create Note')
    );
  }

  Widget makeUpdateInputTextField() {
    return TextField(
      controller: _controller,
      onChanged: (value) => Function.apply(statePage.getUpdateInputFunction(context), [value]),
      decoration: InputDecoration.collapsed(hintText: 'Add a note'),
    );
  }
}