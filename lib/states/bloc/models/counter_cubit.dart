import 'package:bloc/bloc.dart';

import '../../../common/models/counter/counter_state.dart';
import '../../../common/models/counter/counter_view_model.dart';

class CounterCubit extends Cubit<CounterState> implements BaseCounterViewModel {
  CounterCubit([super.initialState = const CounterState()]);

  @override
  void decrement() => emit(state.decrement());

  @override
  void increment() => emit(state.increment());
}
