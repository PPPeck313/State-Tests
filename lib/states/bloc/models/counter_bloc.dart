import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/counter/counter_state_view_model.dart';

import '../../../common/models/counter/counter_event.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> implements CounterStateFunctions {
  CounterBloc([super.initialState = const CounterState()]) {
    on<DecrementEvent>((event, emit) {
      emit(decrement());
    });
    on<IncrementEvent>((event, emit) {
      emit(increment());
    });
  }

  @override
  CounterState decrement() => state.decrement();

  @override
  CounterState increment() => state.increment();
}
