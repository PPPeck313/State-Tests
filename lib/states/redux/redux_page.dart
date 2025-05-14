import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/common/widgets/screen/page/stateless_page.dart';
import 'package:state_tests/states/redux/models/counter_store.dart';
import 'package:state_tests/states/redux/models/notes_store.dart';

class ReduxPage extends StatelessViewModelScopePage {
  @override
  final CounterStore counterViewModel;

  @override
  final NotesStore notesViewModel;

  ReduxPage(this.counterViewModel, this.notesViewModel, {super.key});

  ReduxPage.def({Key? key}) : this(CounterStore(), NotesStore(), key: key);

  @override
  Widget getCounterWidget(Widget Function(void) widget) => StoreProvider<CounterState>(
    store: counterViewModel,
    child: StoreConnector<CounterState, CounterState>(
      converter: (store) => store.state,
      builder: (context, state) => widget(null),
    ),
  );

  @override
  Widget getNotesWidget(Widget Function(void) widget) => StoreProvider<NotesState>(
    store: notesViewModel,
    child: StoreConnector<NotesState, NotesState>(
      converter: (store) => store.state,
      builder: (context, state) => widget(null),
    ),
  );
}
