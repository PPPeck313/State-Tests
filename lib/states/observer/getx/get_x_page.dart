import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:state_tests/common/widgets/screen/page/stateless_page.dart';
import 'package:state_tests/states/observer/getx/models/counter_controller.dart';
import 'package:state_tests/states/observer/getx/models/notes_controller.dart';

class GetXPage extends StatelessObserverScopePage {
  @override
  final CounterController counterViewModel;

  @override
  final NotesController notesViewModel;

  GetXPage(this.counterViewModel, this.notesViewModel, {super.key});

  GetXPage.def({Key? key}) : this(Get.put(CounterController()), Get.put(NotesController()), key: key);

  @override
  Widget getCounterWidget(Widget Function(void) widget) => Obx(() => widget(null));

  @override
  Widget getNotesWidget(Widget Function(void) widget) => Obx(() => widget(null));
}
