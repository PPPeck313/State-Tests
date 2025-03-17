import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/counter/CounterEvent.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterBloc extends Bloc<CounterActions, CounterState> {

  //============================================================================
  // Static Fields
  //============================================================================

  static CounterBloc _instance = CounterBloc._new();

  factory CounterBloc() => _instance;

  //============================================================================
  // Constructors
  //============================================================================

  CounterBloc._new() : super(CounterState());

  //============================================================================
  // Bloc Methods
  //============================================================================

  @override
  void onEvent(Bloc bloc, CounterEvent? event) {
    super.onEvent(bloc, event);

    switch (event) {
      DecrementEvent => state.decrementNew(),
      IncrementEvent => state.incrementNew()
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void dispose() {
    close();
  }
}