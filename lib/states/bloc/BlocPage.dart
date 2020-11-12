import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_tests/common/models/NotesActions.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';
import 'package:state_tests/common/widgets/NotesList.dart';

import 'models/NotesBloc.dart';

class BlocPage extends StatelessWidget implements StatePage {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesBloc>(create: (_) => NotesBloc(),
        child: GenericPage(this)
    );
  }

  //============================================================================
  // StatePage Methods
  //============================================================================

  @override
  String getTag() => "Bloc";



  @override
  Widget getList(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) => NotesList(state)
    );
  }



  @override
  void getAddNoteFunction(BuildContext context) => context.bloc<NotesBloc>().add(AddNoteAction());

  @override
  Function(String p1) getUpdateInputFunction(BuildContext context) => (p1) {
    context.bloc<NotesBloc>().add(UpdateInputAction(p1));
  };
}

