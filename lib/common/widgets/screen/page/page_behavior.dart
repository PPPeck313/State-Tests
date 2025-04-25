import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/widgets/notes/notes.dart';

import '../../../models/counter/base_counter_view_model.dart';
import '../../../models/note/base_notes_view_model.dart';
import '../../builder/builder_type.dart';
import '../../counter/counter.dart';
import '../../debug/debug_padding.dart';

part 'page_behavior.g.dart';

abstract mixin class PageBehavior<A, B> {
  @protected
  Widget getCounterWidget(A widget);

  @protected
  BuilderType<BaseCounterViewModel> get counterBuilder;

  @protected
  Widget getNotesWidget(B widget);

  @protected
  BuilderType<BaseNotesViewModel> get notesBuilder;
}

mixin PageScopedBehavior
    implements PageBehavior<Widget Function(BaseCounterViewModel), Widget Function(BaseNotesViewModel)> {
  @override
  Widget getCounterWidget(Widget Function(BaseCounterViewModel) widget);

  @override
  BuilderType<BaseCounterViewModel> get counterBuilder => Scoped(getCounterWidget);

  @override
  Widget getNotesWidget(Widget Function(BaseNotesViewModel) widget);

  @override
  BuilderType<BaseNotesViewModel> get notesBuilder => Scoped(getNotesWidget);
}

mixin PageViewModelFittedBehavior implements PageBehavior<Widget Function(void), Widget Function(void)> {
  @protected
  BaseCounterViewModel get counterViewModel;

  @protected
  BaseNotesViewModel get notesViewModel;

  @override
  BuilderType<BaseCounterViewModel> get counterBuilder => Fitted(getCounterWidget, counterViewModel);

  @override
  Widget getCounterWidget(Widget Function(void) widget);

  @override
  BuilderType<BaseNotesViewModel> get notesBuilder => Fitted(getNotesWidget, notesViewModel);

  @override
  Widget getNotesWidget(Widget Function(void) widget);
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
