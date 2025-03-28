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

  CommandPage(this.counterViewModel, this.notesViewModel);

  CommandPage.def() : this(CounterCommands(), NotesCommands());

  @override
  Widget getCounterWidget(Widget child) =>
      [counterViewModel.decrementCommand, counterViewModel.incrementCommand].toCommandsWidget(child);

  @override
  Widget getNotesWidget(Widget child) =>
      [notesViewModel.updateInputCommand, notesViewModel.addNoteCommand].toCommandsWidget(child);
}

extension CommandListExtensions on List<Command<dynamic, dynamic>> {
  Widget toCommandsWidget(Widget child) =>
      first.toCommandWidget(length > 1 ? sublist(1, length).toCommandsWidget(child) : child);
}

extension CommandExtensions on Command<dynamic, dynamic> {
  Widget toCommandWidget(Widget child) =>
      ValueListenableBuilder<dynamic>(valueListenable: this, builder: (context, state, _) => child);
}
