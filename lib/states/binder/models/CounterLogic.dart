import 'package:binder/binder.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

final counterRef = StateRef(CounterState());
final counterViewLogicRef = LogicRef((scope) => CounterLogic(scope));

class CounterLogic with Logic {
  CounterLogic(this.scope);

  @override
  final Scope scope;

  void decrement() => write(counterRef, read(counterRef).decrementNew());
  void increment() => write(counterRef, read(counterRef).incrementNew());
}
