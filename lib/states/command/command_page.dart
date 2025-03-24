import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';

import '../../common/pages/generic_page.dart';
import 'models/counter_commands.dart';
import 'models/notes_commands.dart';

class CommandPage extends GenericPageState {
  @override
  final CounterCommands counterViewModel;

  @override
  final NotesCommands notesViewModel;

  CommandPage() : counterViewModel = CounterCommands(), notesViewModel = NotesCommands();

  @override
  Widget? getCounterWidget(Widget child) =>
      [counterViewModel.decrementCommand, counterViewModel.incrementCommand].toCommandsWidget(child);

  @override
  void decrement(BuildContext _) => counterViewModel.decrementCommand();

  @override
  void increment(BuildContext _) => counterViewModel.incrementCommand();

  @override
  Widget? getNotesWidget(Widget child) =>
      [notesViewModel.updateInputCommand, notesViewModel.addNoteCommand].toCommandsWidget(child);

  @override
  void updateInput(BuildContext _, String input) => notesViewModel.updateInputCommand(input);

  @override
  void addNote(BuildContext _) => notesViewModel.addNoteCommand();
}

extension CommandListExtensions on List<Command<dynamic, dynamic>> {
  Widget toCommandsWidget(Widget child) =>
      first.toCommandWidget(length > 1 ? sublist(1, length).toCommandsWidget(child) : child);
}

extension CommandExtensions on Command<dynamic, dynamic> {
  Widget toCommandWidget(Widget child) =>
      ValueListenableBuilder<dynamic>(valueListenable: this, builder: (context, state, _) => child);
}
