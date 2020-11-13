import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterReactiveModel {

  //============================================================================
  // Fields
  //============================================================================

  CounterState state;

  //============================================================================
  // Constructors
  //============================================================================

  CounterReactiveModel() {
    state = CounterState.initial();
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() => state.decrement();

  void increment() => state.increment();
}