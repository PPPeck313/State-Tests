import 'package:get/get.dart';
import 'package:state_tests/common/models/counter/counter_state_view_model.dart';

import '../../../common/models/counter/counter_state.dart';

class CounterController extends GetxController implements CounterStateFunctions {
  Rx<CounterState> state;

  CounterController([CounterState state = const CounterState()]) : state = state.obs;

  @override
  void decrement() => state.value = state.value.decrement();

  @override
  void increment() => state.value = state.value.increment();
}
