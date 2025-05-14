import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../../models/note/base_notes_view_model.dart';
import '../builder/builder_type.dart';
import '../debug/debug_padding.dart';
import 'notes_list.dart';

part 'notes.g.dart';

class Notes extends StatelessWidget {
  final TextEditingController _controller;

  final BuilderType<BaseNotesViewModel> _builder;

  const Notes(this._controller, this._builder, {super.key});

  @override
  Widget build(BuildContext context) => switch (_builder) {
    ViewModelScope<BaseNotesViewModel> scope => NotesFrame(
      _controller,
      scope.viewModel,
      scope.obs((_) => NotesList(scope.viewModel.state)),
    ),
    ProvidedContextScope<BaseNotesViewModel> scope => scope.obs(
      (viewModel) => NotesFrame(_controller, viewModel, NotesList(viewModel.state)),
    ),
    DefaultContextScope<BaseNotesViewModel> scope => scope.obs(
      scope: context,
      (viewModel) => NotesFrame(_controller, viewModel, NotesList(viewModel.state)),
    ),
  };
}

@swidget
Widget notesFrame(TextEditingController controller, BaseNotesViewModel viewModel, Widget notesList) => MyPadding(
  padding: const EdgeInsets.symmetric(vertical: 16.0),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      NoteEditText(controller, viewModel.updateInput),
      AddNoteButton(controller, viewModel.addNote),
      notesList,
    ],
  ),
);

@swidget
Widget noteEditText(TextEditingController controller, void Function(String) updateInput) => TextField(
  controller: controller,
  onChanged: (value) => updateInput(value),
  decoration: InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    filled: true,
    hintStyle: TextStyle(color: Colors.grey),
    hintText: 'Add a note',
    fillColor: Colors.white,
  ),
);

@swidget
Widget addNoteButton(TextEditingController controller, void Function() addNote) => TextButton(
  onPressed: () {
    addNote();
    controller.clear();
  },
  child: Text('Create Note'),
);
