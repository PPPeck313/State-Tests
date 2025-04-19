import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import '../../common/widgets/page/stateless_page.dart';
import 'models/counter_controller.dart';
import 'models/notes_controller.dart';

class GetXPage extends StatelessPage {
  @override
  final CounterController counterViewModel;

  @override
  final NotesController notesViewModel;

  GetXPage(this.counterViewModel, this.notesViewModel);

  GetXPage.def() : this(Get.put(CounterController()), Get.put(NotesController()));

  // Obx needs immediate visibility over .obs usage
  @override
  Widget getCounterWidget(Widget Function(CounterState) counter) => Obx(() => counter(counterViewModel.state));

  @override
  Widget getNotesWidget(Widget Function(NotesState) notes) => Obx(() => notes(notesViewModel.state));
}
