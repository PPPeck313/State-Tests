import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/counter/counter_state_view_model.dart';

import '../../../common/models/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> implements CounterStateFunctions {
  CounterCubit([super.initialState = const CounterState()]);

  @override
  void decrement() => emit(state.decrement());

  @override
  void increment() => emit(state.increment());
}
