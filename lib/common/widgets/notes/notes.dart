import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/models/note/notes_state.dart';

import '../../models/note/base_notes_view_model.dart';
import '../builder/builder_policy.dart';
import '../builder/typed_function.dart';
import 'notes_list.dart';

part 'notes.g.dart';

class Notes extends StatelessWidget {
  static const String updateInput = 'updateInput';
  static const String addNote = 'addNote';

  final TextEditingController _controller;

  final BuilderPolicy<NotesState, BaseNotesViewModel> _policy;

  const Notes(this._controller, this._policy, {super.key});

  @override
  Widget build(BuildContext context) => switch (_policy) {
    Fitted<NotesState, BaseNotesViewModel> f => notesFrame(
      addNoteButton(_controller, Fun1Arg<void, String>(f.viewModel.updateInput)),
      noteEditText(_controller, Fun0Args<void>(f.viewModel.addNote)),
      f.fittedObserver((state) => NotesList(state)),
    ),
    Scoped<NotesState, BaseNotesViewModel> s => s.scopedObserver(
      (args) => notesFrame(
        addNoteButton(_controller, args.functions[addNote] as Fun0Args<void>),
        noteEditText(_controller, args.functions[addNote] as Fun1Arg<void, String>),
        NotesList(args.state),
      ),
    ),
  };
}

@swidget
Widget notesFrame(Widget addNotesButton, Widget editText, Widget notesList) => Column(
  children: [Padding(padding: const EdgeInsets.only(top: 32.0), child: addNotesButton), editText, Divider(), notesList],
);

@swidget
Widget addNoteButton(TextEditingController controller, TypedFunction function) => TextButton(
  onPressed: () {
    function.call();
    controller.clear();
  },
  child: Text('Create Note'),
);

@swidget
Widget noteEditText(TextEditingController controller, TypedFunction function) => TextField(
  controller: controller,
  onChanged: (value) => function.call([value]),
  decoration: InputDecoration.collapsed(hintText: 'Add a note'),
);
