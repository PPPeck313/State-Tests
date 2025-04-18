import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/widgets/generic_page.dart';
import 'models/counter_store_x.dart';
import 'models/notes_store_x.dart';

class MobXPage extends GenericPageState {
  @override
  final CounterStoreX counterViewModel;

  @override
  final NotesStoreX notesViewModel;

  MobXPage(this.counterViewModel, this.notesViewModel);

  MobXPage.def() : this(CounterStoreX(), NotesStoreX());

  // Observer needs immediate visibility over .obs usage
  @override
  Widget getCounterStateWidget(Widget Function(CounterState) child) =>
      Observer(builder: (_) => child(counterViewModel.state));

  @override
  Widget getNotesStateWidget(Widget notes) => Observer(builder: (_) => notes);
}
