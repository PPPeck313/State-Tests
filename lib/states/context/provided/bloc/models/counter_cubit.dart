import 'package:bloc/bloc.dart';

import 'package:state_tests/common/models/counter/base_counter_view_model.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> implements BaseCounterViewModel {
  CounterCubit([super.initialState = const CounterState()]);

  @override
  void decrement() => emit(state.decrement());

  @override
  void increment() => emit(state.increment());
}
