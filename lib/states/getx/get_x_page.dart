import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../common/pages/generic_page.dart';
import 'models/counter_controller.dart';
import 'models/notes_controller.dart';

class GetXPage extends GenericPageState {
  @override
  final CounterController counterViewModel;

  @override
  final NotesController notesViewModel;

  GetXPage(this.counterViewModel, this.notesViewModel);

  GetXPage.def() : this(Get.put(CounterController()), Get.put(NotesController()));

  @override
  Widget getCounterStateWidget(Widget counter) => Obx(() => counter);

  @override
  Widget getNotesStateWidget(Widget notes) => Obx(() => notes);
}
