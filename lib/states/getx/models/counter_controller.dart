import 'package:get/get.dart';

import 'package:state_tests/common/models/counter/base_counter_view_model.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';

class CounterController extends GetxController implements BaseCounterViewModel {
  final Rx<CounterState> xState;

  @override
  CounterState get state => xState.value;

  CounterController([CounterState state = const CounterState()]) : xState = state.obs;

  @override
  void decrement() => xState.value = state.decrement();

  @override
  void increment() => xState.value = state.increment();
}
