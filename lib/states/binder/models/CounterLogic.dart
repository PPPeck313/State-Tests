import 'package:binder/binder.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

final StateRef<CounterState> counterRef = StateRef(CounterState());
final counterViewLogicRef = LogicRef((scope) => CounterLogic(scope));

class CounterLogic with Logic {
  //============================================================================
  // Constructors
  //============================================================================

  CounterLogic(this.scope);

  //============================================================================
  // Logic Methods
  //============================================================================

  @override
  final Scope scope;

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() => write(counterRef, read(counterRef).decrementNew());
  void increment() => write(counterRef, read(counterRef).incrementNew());
}
