import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/states/viewmodel/models/counter_view_model.dart';
import 'package:state_tests/states/viewmodel/models/notes_view_model.dart';

import '../../common/widgets/screen/page/stateless_page.dart';
import 'models/counter_commands.dart';
import 'models/notes_commands.dart';

class CommandPage extends StatelessScopedPage {
  final CounterCommands counterViewModel;
  final NotesCommands notesViewModel;

  CommandPage(this.counterViewModel, this.notesViewModel, {super.key});

  CommandPage.def({Key? key}) : this(CounterCommands(), NotesCommands(), key: key);

  @override
  Widget getCounterWidget(Widget Function(CounterViewModel) widget) => ValueListenableBuilder<CounterState>(
    valueListenable: counterViewModel,
    builder:
        (context, state, _) => widget(
          CounterViewModel(state, counterViewModel.decrementCommand.call, counterViewModel.incrementCommand.call),
        ),
  );

  @override
  Widget getNotesWidget(Widget Function(NotesViewModel) widget) => ValueListenableBuilder<NotesState>(
    valueListenable: notesViewModel,
    builder:
        (context, state, _) =>
            widget(NotesViewModel(state, notesViewModel.updateInputCommand.call, notesViewModel.addNoteCommand.call)),
  );
}
