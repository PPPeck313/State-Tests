import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_tests/common/widgets/screen/page/stateless_page.dart';
import 'package:state_tests/states/observer/mobx/models/counter_store_x.dart';
import 'package:state_tests/states/observer/mobx/models/notes_store_x.dart';

class MobXPage extends StatelessObserverScopePage {
  @override
  final CounterStoreX counterViewModel;

  @override
  final NotesStoreX notesViewModel;

  MobXPage(this.counterViewModel, this.notesViewModel, {super.key});

  MobXPage.def({Key? key}) : this(CounterStoreX(), NotesStoreX(), key: key);

  // Observer needs immediate visibility over .obs usage
  @override
  Widget getCounterWidget(Widget Function(void) widget) => Observer(builder: (_) => widget(null));

  @override
  Widget getNotesWidget(Widget Function(void) widget) => Observer(builder: (_) => widget(null));
}
