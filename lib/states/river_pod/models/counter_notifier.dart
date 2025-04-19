import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/base_counter_view_model.dart';
import '../../../common/models/counter/counter_state.dart';

part 'counter_notifier.g.dart';

@riverpod
class CounterNotifier extends _$CounterNotifier implements BaseCounterViewModel {
  @override
  CounterState build() => CounterState();

  @override
  void decrement() => state = state.decrement();

  @override
  void increment() => state = state.increment();
}
