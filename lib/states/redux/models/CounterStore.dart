import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:state_tests/common/models/counter/CounterActions.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterStore extends Store<CounterState> {

  //============================================================================
  // Constructors
  //===========================================================================

  CounterStore() : super((CounterState state, dynamic action) {
    if (action is DecrementAction) {
      state.decrement();
    }

    else if (action is IncrementAction) {
      state.increment();
    }

    return state;
  }, initialState: CounterState.initial(),
      middleware: [LoggingMiddleware.printer()]);
}