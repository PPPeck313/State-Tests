import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/generic_page.dart';
import 'models/counter_store.dart';
import 'models/notes_store.dart';

class ReduxPage extends GenericPageState {
  @override
  final CounterStore counterViewModel;

  @override
  final NotesStore notesViewModel;

  ReduxPage(this.counterViewModel, this.notesViewModel);

  ReduxPage.def() : this(CounterStore(), NotesStore());

  @override
  Widget getCounterStateWidget(Widget counter) => StoreProvider<CounterState>(store: counterViewModel, child: counter);

  @override
  Widget getNotesStateWidget(Widget notes) => StoreProvider<NotesState>(store: notesViewModel, child: notes);
}
