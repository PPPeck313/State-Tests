import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common/pages/generic_page.dart';
import 'models/counter_store_x.dart';
import 'models/notes_store_x.dart';

class MobXPage extends GenericPageState {
  @override
  final CounterStoreX counterViewModel;

  @override
  final NotesStoreX notesViewModel;

  MobXPage(this.counterViewModel, this.notesViewModel);

  MobXPage.def() : this(CounterStoreX(), NotesStoreX());

  @override
  Widget getCounterWidget(Widget child) => Observer(builder: (_) => child);

  @override
  Widget getNotesWidget(Widget child) => Observer(builder: (_) => child);
}
