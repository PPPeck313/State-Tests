import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';

import '../../common/models/note/notes_state.dart';
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
  Widget getCounterWidget(Widget Function(CounterState) wFun) => [
    counterViewModel.decrementCommand,
    counterViewModel.incrementCommand,
  ].toCommandsWidget(wFun(counterViewModel.state));

  @override
  Widget getNotesWidget(Widget Function(NotesState) wFun) =>
      [notesViewModel.updateInputCommand, notesViewModel.addNoteCommand].toCommandsWidget(wFun(notesViewModel.state));
}

extension CommandListExtensions on List<Command<dynamic, dynamic>> {
  Widget toCommandsWidget(Widget child) =>
      first.toCommandWidget(length > 1 ? sublist(1, length).toCommandsWidget(child) : child);
}

extension CommandExtensions on Command<dynamic, dynamic> {
  Widget toCommandWidget(Widget child) =>
      ValueListenableBuilder<dynamic>(valueListenable: this, builder: (context, state, _) => child);
}
