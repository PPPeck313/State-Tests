import 'package:dart_mappable/dart_mappable.dart';

import '../reactive_state.dart';

part 'counter_state.mapper.dart';

@MappableClass()
final class CounterState with CounterStateMappable implements ReactiveState {
  final int count;

  const CounterState({this.count = 0});

  // 0 and -1 have the same hashCode otherwise
  @override
  int get hashCode => count;
}

extension CounterStateExtensions on CounterState {
  CounterState increment() => copyWith(count: count + 1);
  CounterState decrement() => copyWith(count: count - 1);
}
