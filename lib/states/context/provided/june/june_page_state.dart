import 'package:flutter/widgets.dart';
import 'package:june/june.dart';
import 'package:state_tests/common/widgets/screen/page/stateless_page.dart';
import 'package:state_tests/states/context/provided/june/models/counter_june.dart';
import 'package:state_tests/states/context/provided/june/models/notes_june.dart';

class JunePage extends StatelessProvidedContextScopePage {
  JunePage({super.key});

  @override
  Widget getCounterWidget(Widget Function(CounterJune) widget) =>
      JuneBuilder(() => CounterJune(), builder: (vm) => widget(vm));

  @override
  Widget getNotesWidget(Widget Function(NotesJune) widget) =>
      JuneBuilder(() => NotesJune(), builder: (vm) => widget(vm));
}
