import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import '../../../common/models/counter/counter_event.dart';
import '../../../common/models/counter/counter_state.dart';
import '../../../common/models/counter/counter_view_model.dart';

class CounterStore implements BaseCounterViewModel {
  late Store<CounterState> store; // can initialize in Store super constructor, but can't use instance methods

  @override
  CounterState get state => store.state;

  CounterStore([CounterState state = const CounterState()]) {
    store = Store<CounterState>(
      (CounterState state, dynamic action) => switch (action) {
        DecrementEvent _ => decrement(),
        IncrementEvent _ => increment(),
        Object _ => throw UnimplementedError(),
        null => throw UnimplementedError(),
      },
      initialState: state,
      middleware: [LoggingMiddleware().call],
    );
  }

  @override
  CounterState decrement() => state.decrement();

  @override
  CounterState increment() => state.increment();
}
