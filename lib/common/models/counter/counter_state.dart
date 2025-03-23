import 'package:dart_mappable/dart_mappable.dart';

part 'counter_state.mapper.dart';

//needs to be a new object for Binder, Bloc, Cubit, Command, RiverPod
@MappableClass()
class CounterState with CounterStateMappable {
  final int count;

  const CounterState({this.count = 0});
}

extension CounterStateExtensions on CounterState {
  CounterState increment() => copyWith(count: count + 1);
  CounterState decrement() => copyWith(count: count - 1);
}
