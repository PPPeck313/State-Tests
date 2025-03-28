import 'package:flutter/widgets.dart';

import '../../common/widgets/generic_page.dart';
import '../redux/models/counter_store.dart';
import '../redux/models/notes_store.dart';

class ViewModelPage extends GenericPageState {
  @override
  final CounterStore counterViewModel = CounterStore();

  @override
  final NotesStore notesViewModel = NotesStore();

  @override
  void decrement(BuildContext context) => setState(() {
    super.decrement(context);
  });

  @override
  void increment(BuildContext context) => setState(() {
    super.increment(context);
  });

  @override
  void updateInput(BuildContext context, String input) => setState(() {
    super.updateInput(context, input);
  });

  @override
  void addNote(BuildContext context) => setState(() {
    super.addNote(context);
  });
}
