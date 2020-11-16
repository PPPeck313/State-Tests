import 'package:get/get.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterController extends GetxController {

  //============================================================================
  // Fields
  //============================================================================

  Rx<CounterState> state;

  //============================================================================
  // Constructors
  //============================================================================

  CounterController() {
    state = CounterState.initial().obs;
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() => state.value = state.value.decrementNew();

  void increment() => state.value = state.value.incrementNew();
}