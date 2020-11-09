import 'package:flutter/widgets.dart';

abstract class StatePage {
  String getTag();

  Widget getList(BuildContext context);

  void getAddNoteFunction(BuildContext context);
  Function(String) getUpdateInputFunction(BuildContext context);
}