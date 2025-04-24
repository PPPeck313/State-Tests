import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../../models/note/base_notes_view_model.dart';
import '../builder/builder_type.dart';
import 'notes_list.dart';

part 'notes.g.dart';

class Notes extends StatelessWidget {
  final TextEditingController _controller;

  final BuilderType<BaseNotesViewModel> _builder;

  const Notes(this._controller, this._builder, {super.key});

  @override
  Widget build(BuildContext context) => switch (_builder) {
    Fitted<BaseNotesViewModel> f => notesFrame(_controller, f.viewModel, f.obs((_) => NotesList(f.viewModel.state))),
    Scoped<BaseNotesViewModel> s => s.obs((vM) => notesFrame(_controller, vM, NotesList(vM.state))),
  };
}

@swidget
Widget notesFrame(TextEditingController controller, BaseNotesViewModel viewModel, Widget notesList) => Column(
  children: [
    Padding(padding: const EdgeInsets.only(top: 32.0), child: addNoteButton(controller, viewModel.addNote)),
    noteEditText(controller, viewModel.updateInput),
    Divider(),
    notesList,
  ],
);

@swidget
Widget noteEditText(TextEditingController controller, void Function(String) updateInput) => TextField(
  controller: controller,
  onChanged: (value) => updateInput(value),
  decoration: InputDecoration.collapsed(hintText: 'Add a note'),
);

@swidget
Widget addNoteButton(TextEditingController controller, void Function() addNote) => TextButton(
  onPressed: () {
    addNote();
    controller.clear();
  },
  child: Text('Create Note'),
);
