import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:state_tests/common/pages/generic_page.dart';

import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_state.dart';
import 'models/counter_controller.dart';
import 'models/notes_controller.dart';

class GetXPage extends GenericPageState {
  final CounterController _counterController;
  final NotesController _notesController;

  GetXPage() : _counterController = Get.put(CounterController()), _notesController = Get.put(NotesController());

  @override
  Widget? getCounterWidget(Widget child) => Obx(() => child);

  @override
  CounterState getCounterState(BuildContext _) => _counterController.state.value;

  @override
  void decrement(BuildContext _) => _counterController.decrement();

  @override
  void increment(BuildContext _) => _counterController.increment();

  @override
  Widget? getNotesWidget(Widget child) => Obx(() => child);

  @override
  NotesState getNotesState(BuildContext _) => _notesController.state.value;

  @override
  void addNote(BuildContext _) => _notesController.addNote();

  @override
  void updateInput(BuildContext _, String input) => _notesController.updateInput(input);
}
