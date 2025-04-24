import 'package:flutter/widgets.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/common/widgets/builder/typed_function.dart';
import 'package:state_tests/common/widgets/counter/counter.dart';
import 'package:state_tests/common/widgets/page/stateful_page.dart';
import 'package:state_tests/states/viewmodel/models/counter_view_model.dart';
import 'package:state_tests/states/viewmodel/models/notes_view_model.dart';

import '../../common/widgets/builder/builder_policy.dart';
import '../../common/widgets/notes/notes.dart';

class ViewModelPageState extends StatefulPageState {
  final CounterViewModel counterViewModel;
  final NotesViewModel notesViewModel;

  ViewModelPageState(this.counterViewModel, this.notesViewModel);

  ViewModelPageState.def() : this(CounterViewModel(), NotesViewModel());

  @override
  Widget getCounterWidget(Widget Function(ScopedArgs<CounterState>) wFun) => wFun(
    ScopedArgs(counterViewModel.state, {
      Counter.decrement: Fun0Args<void>(
        () => setState(() {
          counterViewModel.decrement();
        }),
      ),
      Counter.increment: Fun0Args<void>(
        () => setState(() {
          counterViewModel.increment();
        }),
      ),
    }),
  );

  @override
  Widget getNotesWidget(Widget Function(ScopedArgs<NotesState>) wFun) => wFun(
    ScopedArgs(notesViewModel.state, {
      Notes.updateInput: Fun1Arg<void, String>(
        (input) => setState(() {
          notesViewModel.updateInput(input);
        }),
      ),
      Notes.addNote: Fun0Args<void>(
        () => setState(() {
          notesViewModel.addNote();
        }),
      ),
    }),
  );
}
