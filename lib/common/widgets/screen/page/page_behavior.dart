import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/models/reactive_state.dart';
import 'package:state_tests/common/widgets/notes/notes.dart';

import '../../../models/counter/base_counter_view_model.dart';
import '../../../models/note/base_notes_view_model.dart';
import '../../builder/builder_type.dart';
import '../../counter/counter.dart';
import '../../debug/debug_padding.dart';

part 'page_behavior.g.dart';

abstract mixin class PageBehavior<C, N> {
  @protected
  Widget getCounterWidget(Widget Function(C) widget);

  @protected
  BuilderType<BaseCounterViewModel> get counterBuilder;

  @protected
  Widget getNotesWidget(Widget Function(N) widget);

  @protected
  BuilderType<BaseNotesViewModel> get notesBuilder;
}

mixin ViewModelScopeBehavior implements PageBehavior<void, void> {
  @protected
  BaseCounterViewModel get counterViewModel;

  @protected
  BaseNotesViewModel get notesViewModel;

  @override
  Widget getCounterWidget(Widget Function(void) widget);

  @override
  BuilderType<BaseCounterViewModel> get counterBuilder => ViewModelScope(getCounterWidget, counterViewModel);

  @override
  Widget getNotesWidget(Widget Function(void) widget);

  @override
  BuilderType<BaseNotesViewModel> get notesBuilder => ViewModelScope(getNotesWidget, notesViewModel);
}

abstract mixin class ContextScopeBehavior<C extends ReactiveViewModel, N extends ReactiveViewModel>
    implements PageBehavior<C, N> {}

mixin ProvidedContextScopeBehavior implements ContextScopeBehavior<BaseCounterViewModel, BaseNotesViewModel> {
  @override
  Widget getCounterWidget(Widget Function(BaseCounterViewModel) widget);

  @override
  BuilderType<BaseCounterViewModel> get counterBuilder => ProvidedContextScope(getCounterWidget);

  @override
  Widget getNotesWidget(Widget Function(BaseNotesViewModel) widget);

  @override
  BuilderType<BaseNotesViewModel> get notesBuilder => ProvidedContextScope(getNotesWidget);
}

mixin DefaultContextScopeBehavior implements ContextScopeBehavior<BaseCounterViewModel, BaseNotesViewModel> {
  @override
  Widget getCounterWidget(Widget Function(BaseCounterViewModel) widget, {BuildContext scope});

  @override
  BuilderType<BaseCounterViewModel> get counterBuilder => DefaultContextScope(getCounterWidget);

  @override
  Widget getNotesWidget(Widget Function(BaseNotesViewModel) widget, {BuildContext scope});

  @override
  BuilderType<BaseNotesViewModel> get notesBuilder => DefaultContextScope(getNotesWidget);
}

@swidget
Widget pageStarter(
  BuilderType<BaseCounterViewModel> counterPolicy,
  BuilderType<BaseNotesViewModel> notesPolicy,
  TextEditingController controller,
) => Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Counter(counterPolicy),
    MyPadding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Divider()),
    Notes(controller, notesPolicy),
  ],
);
