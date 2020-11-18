import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterReactiveModel {

  //============================================================================
  // Static Fields
  //============================================================================

  static CounterReactiveModel _instance = CounterReactiveModel._new(CounterState.initial());

  factory CounterReactiveModel() => _instance;

  //============================================================================
  // Fields
  //============================================================================

  CounterState state;

  //============================================================================
  // Constructors
  //============================================================================

  CounterReactiveModel._new(this.state);

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() => state.decrement();

  void increment() => state.increment();
}