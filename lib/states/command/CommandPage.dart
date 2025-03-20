import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';
import 'package:state_tests/common/models/note/NotesList.dart';
import 'package:state_tests/common/models/note/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:state_tests/states/command/models/CounterCommand.dart';

import 'models/NotesCommand.dart';

class CommandPage extends StatelessWidget implements StatePage {
  const CommandPage({super.key});

  final _counterCommand = CounterCommand();
  final _notesCommand = NotesCommand();

  @override
  Widget build(BuildContext context) => GenericPage(this);

  @override
  String getTag() => 'Command';

  @override
  Widget getCounterText(BuildContext context) => ValueListenableBuilder<CounterState>(
    valueListenable: _counterCommand.updateCountCommand,
    builder: (context, state, _) => Text('${state.count}', style: TextStyle(fontSize: 60.0)),
  );

  @override
  void decrement(BuildContext context) => _counterCommand.updateCountCommand(DecrementAction());

  @override
  void increment(BuildContext context) => _counterCommand.updateCountCommand(IncrementAction());

  @override
  Widget getNotesList(BuildContext context) => ValueListenableBuilder<NotesState>(
    valueListenable: _notesCommand.addNoteCommand,
    builder: (context, state, _) => NotesList(state),
  );

  @override
  void addNote(BuildContext context) => _notesCommand.addNoteCommand.execute();

  @override
  void updateInput(BuildContext context, String input) => _notesCommand.updateInputCommand(input);
}
