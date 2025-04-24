import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';

import '../../common/widgets/page/stateless_page.dart';
import 'models/counter_commands.dart';
import 'models/notes_commands.dart';

class CommandPage extends StatelessPage {
  @override
  final CounterCommands counterViewModel;

  @override
  final NotesCommands notesViewModel;

  CommandPage(this.counterViewModel, this.notesViewModel, {super.key});

  CommandPage.def({Key? key}) : this(CounterCommands(), NotesCommands(), key: key);

  @override
  Widget getCounterWidget(Widget Function(void) widget) =>
      [counterViewModel.decrementCommand, counterViewModel.incrementCommand].toCommandsWidget(widget(null));

  @override
  Widget getNotesWidget(Widget Function(void) widget) =>
      [notesViewModel.updateInputCommand, notesViewModel.addNoteCommand].toCommandsWidget(widget(null));
}

extension CommandListExtensions on List<Command<dynamic, dynamic>> {
  Widget toCommandsWidget(Widget child) =>
      first.toCommandWidget(length > 1 ? sublist(1, length).toCommandsWidget(child) : child);
}

extension CommandExtensions on Command<dynamic, dynamic> {
  Widget toCommandWidget(Widget child) =>
      ValueListenableBuilder<dynamic>(valueListenable: this, builder: (context, state, _) => child);
}
