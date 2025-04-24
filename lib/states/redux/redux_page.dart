import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/page/stateless_page.dart';
import 'models/counter_store.dart';
import 'models/notes_store.dart';

class ReduxPage extends StatelessPage {
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
  Widget getNotesWidget(Widget Function(void) widget) => StoreProvider<CounterState>(
    store: counterViewModel,
    child: StoreConnector<NotesState, NotesState>(
      converter: (store) => store.state,
      builder: (context, state) => widget(null),
    ),
  );
}
