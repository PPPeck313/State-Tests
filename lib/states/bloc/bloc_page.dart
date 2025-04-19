import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_tests/common/widgets/page/stateless_page.dart';

import '../../common/models/counter/counter_event.dart';
import '../../common/models/counter/counter_state.dart';
import '../../common/models/note/notes_event.dart';
import '../../common/models/note/notes_state.dart';
import 'models/counter_bloc.dart';
import 'models/notes_bloc.dart';

class BlocPage extends StatelessPage {
  @override
  Widget buildPage(BuildContext context, TextEditingController controller) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext _) => CounterBloc()),
      BlocProvider(create: (BuildContext _) => NotesBloc()),
    ],
    child: super.buildPage(context, controller),
  );

  @override
  Widget getCounterWidget(Widget Function(CounterState) counter) =>
      BlocBuilder<CounterBloc, CounterState>(builder: (context, _) => counter(context.watch<CounterBloc>().state));

  @override
  void decrement(BuildContext context) => context.read<CounterBloc>().add(DecrementEvent());

  @override
  void increment(BuildContext context) => context.read<CounterBloc>().add(IncrementEvent());

  @override
  Widget getNotesWidget(Widget Function(NotesState) notes) =>
      BlocBuilder<NotesBloc, NotesState>(builder: (context, _) => notes(context.watch<NotesBloc>().state));

  @override
  void updateInput(BuildContext context, String input) => context.read<NotesBloc>().add(UpdateInputEvent(input));

  @override
  void addNote(BuildContext context) => context.read<NotesBloc>().add(AddNoteEvent());
}
