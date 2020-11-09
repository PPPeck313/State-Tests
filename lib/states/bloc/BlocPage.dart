import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_tests/common/models/NotesState.dart';
import 'package:state_tests/common/widgets/NotesList.dart';
import 'package:state_tests/common/pages/GenericPage.dart';
import 'package:state_tests/common/pages/StatePage.dart';

import 'models/NotesCubit.dart';

class BlocPage extends StatefulWidget {

  //============================================================================
  // Constructors
  //============================================================================

  const BlocPage({Key key}) : super(key: key);

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  _BlocPageState createState() => _BlocPageState();
}



class _BlocPageState extends State<BlocPage> implements StatePage {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesCubit>(create: (_) => NotesCubit(),
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
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) => NotesList(state)
    );
  }



  @override
  void getAddNoteFunction(BuildContext context) => context.bloc<NotesCubit>().addNote();

  @override
  Function(String p1) getUpdateInputFunction(BuildContext context) => context.bloc<NotesCubit>().updateInput;
}