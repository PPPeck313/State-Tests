import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../common/models/base_counter_view_model.dart';
import '../../../common/models/counter/counter_event.dart';
import '../../../common/models/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> implements BaseCounterViewModel {
  CounterBloc([super.initialState = const CounterState()]) {
    on<DecrementEvent>((_, emit) => emit(state.decrement()), transformer: droppable());
    on<IncrementEvent>((_, emit) => emit(state.increment()), transformer: droppable());
  }

  @override
  void decrement() => add(DecrementEvent());

  @override
  void increment() => add(IncrementEvent());
}
