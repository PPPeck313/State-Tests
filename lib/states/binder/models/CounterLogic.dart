import 'package:binder/binder.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterLogic with Logic {

  //============================================================================
  // Static Fields
  //============================================================================

  static final counterRef = StateRef(CounterState.initial());
  static final counterLogicRef = LogicRef((scope) => CounterLogic(scope));

  //============================================================================
  // Constructors
  //============================================================================

  const CounterLogic(this.scope);

  //============================================================================
  // Logic Methods
  //============================================================================

  @override
  final Scope scope;

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() {
    CounterState state = read(counterRef).decrementNew();
    write(counterRef, state);
  }

  void increment() {
    CounterState state = read(counterRef).incrementNew();
    write(counterRef, state);
  }
}