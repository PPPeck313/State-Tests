import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/base_counter_view_model.dart';
import '../../../common/models/counter/counter_state.dart';

part 'counter_provider.g.dart';

@riverpod
class CounterProvider extends _$CounterProvider implements BaseCounterViewModel {
  final Provider<CounterState> provider;

  CounterProvider([CounterState state = const CounterState()]) : provider = Provider((ref) => state) {
    this.state = state;
  }

  @override
  CounterState build() => state;

  @override
  void decrement() => state = state.decrement();

  @override
  void increment() => state = state.increment();
}
