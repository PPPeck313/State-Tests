import 'package:bloc/bloc.dart';
import 'package:state_tests/common/models/counter/CounterActions.dart';
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

  CounterBloc._new() : super(CounterState.initial());

  //============================================================================
  // Bloc Methods
  //============================================================================

  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterActions event) async* {
    if (event is DecrementAction) {
      yield state.decrementNew();
    }

    else if (event is IncrementAction) {
      yield state.incrementNew();
    }
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void dispose() {
    close();
  }
}