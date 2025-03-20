import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/counter/CounterEvent.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //============================================================================
  // Constructors
  //============================================================================

  CounterBloc() : super(CounterState());

  //============================================================================
  // Bloc Methods
  //============================================================================

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);

    switch (event) {
      case DecrementEvent():
        state.decrementNew();
      case IncrementEvent():
        state.incrementNew();
    }
  }
}
