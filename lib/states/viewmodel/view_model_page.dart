import 'package:flutter/widgets.dart';

import '../../common/widgets/generic_page.dart';
import '../redux/models/counter_store.dart';
import '../redux/models/notes_store.dart';

class ViewModelPage extends GenericPageState {
  @override
  final CounterStore counterViewModel;

  @override
  final NotesStore notesViewModel;

  ViewModelPage(this.counterViewModel, this.notesViewModel);

  ViewModelPage.def() : this(CounterStore(), NotesStore());

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
