import 'package:binder/binder.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterLogic with Logic {

  //============================================================================
  // Static Fields
  //============================================================================

  //BinderScope disposes values when out of scope, but can jumpstart value on recreation with override
  static CounterState counterState = CounterState.initial();

  static final StateRef<CounterState> counterRef = StateRef(counterState);
  static final LogicRef<CounterLogic> counterLogicRef = LogicRef((scope) => CounterLogic(scope));

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
    counterState = read(counterRef).decrementNew();
    write(counterRef, counterState);
  }

  void increment() {
    counterState = read(counterRef).incrementNew();
    write(counterRef, counterState);
  }
}