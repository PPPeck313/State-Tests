import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/models/counter/counter_event.dart';
import '../../../common/models/counter/counter_state.dart';
import '../../../common/models/counter/counter_view_model.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> implements BaseCounterViewModel {
  CounterBloc([super.initialState = const CounterState()]) {
    on<DecrementEvent>((_, emit) => emit(decrement()));
    on<IncrementEvent>((_, emit) => emit(increment()));
  }

  @protected
  @override
  CounterState decrement() => state.decrement();

  @protected
  @override
  CounterState increment() => state.increment();
}
