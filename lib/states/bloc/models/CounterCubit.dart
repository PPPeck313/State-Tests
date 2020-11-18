import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterCubit extends Cubit<CounterState> {

  //============================================================================
  // Static Fields
  //============================================================================

  static CounterCubit _instance = CounterCubit._new();

  factory CounterCubit() => _instance;

  //============================================================================
  // Constructors
  //============================================================================

  CounterCubit._new() : super(CounterState.initial());

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() => emit(state.decrementNew());

  void increment() => emit(state.incrementNew());
}