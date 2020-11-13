import 'package:flutter/widgets.dart';

abstract class StatePage {
  String getTag();

  Widget getCounterText(BuildContext context);
  void increment(BuildContext context);
  void decrement(BuildContext context);

  Widget getNotesList(BuildContext context);
  void addNote(BuildContext context);
  void updateInput(BuildContext context, String input);
}