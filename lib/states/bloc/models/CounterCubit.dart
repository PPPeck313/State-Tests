import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());

  void decrement() => emit(state.decrementNew());
  void increment() => emit(state.incrementNew());
}
