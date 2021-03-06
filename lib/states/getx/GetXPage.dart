import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/states/getx/models/CounterController.dart';

import 'models/NotesController.dart';

class GetXPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Fields
  //============================================================================

  final _counterController = Get.put(CounterController());
  final _notesController = Get.put(NotesController());

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return GenericPage(this);
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "GetX";



  @override
  Widget getCounterText(BuildContext context) => Obx(() => Text('${_counterController.state.value.count}', style: new TextStyle(fontSize: 60.0)));

  @override
  void decrement(BuildContext context) => _counterController.decrement();

  @override
  void increment(BuildContext context) => _counterController.increment();



  @override
  Widget getNotesList(BuildContext context) => Obx(() => NotesList(_notesController.state.value));

  @override
  void addNote(BuildContext context) => _notesController.addNote();

  @override
  void updateInput(BuildContext context, String input) => _notesController.updateInput(input);
}