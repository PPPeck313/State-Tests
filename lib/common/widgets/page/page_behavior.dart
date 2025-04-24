import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/common/models/note/notes_state.dart';
import 'package:state_tests/common/widgets/builder/builder_policy.dart';

import '../../models/counter/base_counter_view_model.dart';
import '../../models/note/base_notes_view_model.dart';
import '../counter/counter.dart';
import '../notes/notes.dart';

part 'page_behavior.g.dart';

abstract mixin class PageBehavior<A, B> {
  @protected
  TextEditingController get controller;

  @protected
  Widget getCounterWidget(Widget Function(A) wFun);

  @protected
  BuilderPolicy<CounterState, BaseCounterViewModel> get counterPolicy;

  @protected
  Widget getNotesWidget(Widget Function(B) wFun);

  @protected
  BuilderPolicy<NotesState, BaseNotesViewModel> get notesPolicy;
}

mixin PageScopedBehavior implements PageBehavior<ScopedArgs<CounterState>, ScopedArgs<NotesState>> {
  @override
  Widget getCounterWidget(Widget Function(ScopedArgs<CounterState>) wFun);

  @override
  BuilderPolicy<CounterState, BaseCounterViewModel> get counterPolicy => Scoped(getCounterWidget);

  @override
  Widget getNotesWidget(Widget Function(ScopedArgs<NotesState>) wFun);

  @override
  BuilderPolicy<NotesState, BaseNotesViewModel> get notesPolicy => Scoped(getNotesWidget);
}

mixin PageViewModelFittedBehavior implements PageBehavior<CounterState, NotesState> {
  @protected
  BaseCounterViewModel get counterViewModel;

  @protected
  BaseNotesViewModel get notesViewModel;

  @override
  BuilderPolicy<CounterState, BaseCounterViewModel> get counterPolicy => Fitted(getCounterWidget, counterViewModel);

  @override
  Widget getCounterWidget(Widget Function(CounterState) wFun);

  @override
  BuilderPolicy<NotesState, BaseNotesViewModel> get notesPolicy => Fitted(getNotesWidget, notesViewModel);

  @override
  Widget getNotesWidget(Widget Function(NotesState) wFun);
}

@swidget
Widget pageStarter(
  BuilderPolicy<CounterState, BaseCounterViewModel> counterPolicy,
  BuilderPolicy<NotesState, BaseNotesViewModel> notesPolicy,
  TextEditingController controller,
) => Scaffold(
  body: Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
    child: Column(children: [Counter(counterPolicy), Notes(controller, notesPolicy)]),
  ),
);
