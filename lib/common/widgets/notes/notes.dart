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
    Fitted<BaseNotesViewModel> f => NotesFrame(_controller, f.viewModel, f.obs((_) => NotesList(f.viewModel.state))),
    Scoped<BaseNotesViewModel> s => s.obs((vM) => NotesFrame(_controller, vM, NotesList(vM.state))),
  };
}

@swidget
Widget notesFrame(TextEditingController controller, BaseNotesViewModel viewModel, Widget notesList) => Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    NoteEditText(controller, viewModel.updateInput),
    Padding(padding: const EdgeInsets.only(top: 16.0), child: AddNoteButton(controller, viewModel.addNote)),
    //notesList,
  ],
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
