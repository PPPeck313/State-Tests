import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/pages/generic_page.dart';
import 'models/counter_commands.dart';
import 'models/notes_commands.dart';

class CommandPage extends GenericPageState {
  final CounterCommands _counterCommand;
  final NotesCommands _notesCommand;

  CommandPage() : _counterCommand = CounterCommands(), _notesCommand = NotesCommands();

  @override
  Widget? getCounterWidget(Widget child) =>
      [_counterCommand.decrementCommand, _counterCommand.incrementCommand].toCommandsWidget(child);

  @override
  CounterState getCounterState(BuildContext _) => _counterCommand.state;

  @override
  void decrement(BuildContext _) => _counterCommand.decrementCommand();

  @override
  void increment(BuildContext _) => _counterCommand.incrementCommand();

  @override
  Widget? getNotesWidget(Widget child) =>
      [_notesCommand.updateInputCommand, _notesCommand.addNoteCommand].toCommandsWidget(child);

  @override
  NotesState getNotesState(BuildContext _) => _notesCommand.state;

  @override
  void updateInput(BuildContext _, String input) => _notesCommand.updateInputCommand(input);

  @override
  void addNote(BuildContext _) => _notesCommand.addNoteCommand();
}

extension CommandListExtensions on List<Command<dynamic, dynamic>> {
  Widget toCommandsWidget(Widget child) =>
      first.toCommandWidget(length > 1 ? sublist(1, length).toCommandsWidget(child) : child);
}

extension CommandExtensions on Command<dynamic, dynamic> {
  Widget toCommandWidget(Widget child) =>
      ValueListenableBuilder<dynamic>(valueListenable: this, builder: (context, state, _) => child);
}
