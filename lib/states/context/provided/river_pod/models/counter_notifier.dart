import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/states/counter_view_model.dart';

part 'counter_notifier.g.dart';

@riverpod
class CounterNotifier extends _$CounterNotifier with CounterViewModelBehavior {
  @override
  CounterState build() => CounterState();
}
