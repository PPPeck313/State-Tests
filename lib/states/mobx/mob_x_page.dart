import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/page/stateless_page.dart';
import 'models/counter_store_x.dart';
import 'models/notes_store_x.dart';

class MobXPage extends StatelessPage {
  @override
  final CounterStoreX counterViewModel;

  @override
  final NotesStoreX notesViewModel;

  MobXPage(this.counterViewModel, this.notesViewModel, {super.key});

  MobXPage.def({Key? key}) : this(CounterStoreX(), NotesStoreX(), key: key);

  // Observer needs immediate visibility over .obs usage
  @override
  Widget getCounterWidget(Widget Function(CounterState) wFun) => Observer(builder: (_) => wFun(counterViewModel.state));

  @override
  Widget getNotesWidget(Widget Function(NotesState) wFun) => Observer(builder: (_) => wFun(notesViewModel.state));
}
