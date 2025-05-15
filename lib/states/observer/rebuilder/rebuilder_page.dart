import 'package:flutter/material.dart';
import 'package:state_tests/common/widgets/screen/page/stateless_page.dart';
import 'package:state_tests/states/observer/rebuilder/models/counter_rebuilder.dart';
import 'package:state_tests/states/observer/rebuilder/models/notes_rebuilder.dart';
import 'package:states_rebuilder/scr/state_management/listeners/on_reactive.dart';

class RebuilderPage extends StatelessObserverScopePage {
  @override
  final CounterRebuilder counterViewModel;

  @override
  final NotesRebuilder notesViewModel;

  RebuilderPage(this.counterViewModel, this.notesViewModel, {super.key});

  RebuilderPage.def({Key? key}) : this(CounterRebuilder(), NotesRebuilder(), key: key);

  @override
  Widget getCounterWidget(Widget Function(void) widget) => OnReactive(() => widget(null));

  @override
  Widget getNotesWidget(Widget Function(void) widget) => OnReactive(() => widget(null));
}
