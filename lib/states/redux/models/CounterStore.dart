import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterStore extends Store<CounterState> {
  //============================================================================
  // Static Fields
  //============================================================================

  static final CounterStore _instance = CounterStore._new();

  factory CounterStore() => _instance;

  //============================================================================
  // Constructors
  //============================================================================

  CounterStore._new()
      : super(
          (CounterState state, dynamic action) {
            if (action is DecrementAction) {
              state.decrement();
            } else if (action is IncrementAction) {
              state.increment();
            }

            return state;
          },
          initialState: CounterState.initial(),
          middleware: [LoggingMiddleware.printer().call],
        );
}
