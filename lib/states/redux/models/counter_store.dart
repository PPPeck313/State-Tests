import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import '../../../common/models/base_counter_view_model.dart';
import '../../../common/models/counter/counter_event.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterStore implements BaseCounterViewModel {
  Store<CounterState> store;

  @override
  CounterState get state => store.state;

  CounterStore([CounterState state = const CounterState()])
    : store = Store<CounterState>(
        (CounterState state, dynamic action) => switch (action) {
          DecrementEvent _ => state.decrement(),
          IncrementEvent _ => state.increment(),
          Object _ => throw UnimplementedError(),
          null => throw UnimplementedError(),
        },
        initialState: state,
        middleware: [LoggingMiddleware().call],
      );

  @override
  void decrement() => store.dispatch(DecrementEvent());

  @override
  void increment() => store.dispatch(IncrementEvent());
}
