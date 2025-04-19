import 'package:flutter/widgets.dart';
import 'package:state_tests/common/widgets/page/stateful_page.dart';

import '../redux/models/counter_store.dart';
import '../redux/models/notes_store.dart';

class ViewModelPageState extends StatefulPageState {
  @override
  final CounterStore counterViewModel;

  @override
  final NotesStore notesViewModel;

  ViewModelPageState(this.counterViewModel, this.notesViewModel);

  ViewModelPageState.def() : this(CounterStore(), NotesStore());

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
