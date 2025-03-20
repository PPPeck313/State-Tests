import 'package:dart_mappable/dart_mappable.dart';

part 'counter_state.mapper.dart';

//needs to be a new object for Binder, Bloc, Cubit, Command, RiverPod
@MappableClass()
class CounterState with CounterStateMappable {
  int count;

  CounterState({this.count = 0});

  void increment() => ++count;
  CounterState incrementNew() => copyWith(count: ++count);

  void decrement() => --count;
  CounterState decrementNew() => copyWith(count: --count);
}
