import 'package:get/get.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterController extends GetxController {

  //============================================================================
  // Static Fields
  //============================================================================

  static CounterController _instance = CounterController._new();

  factory CounterController() => _instance;

  //============================================================================
  // Fields
  //============================================================================

  Rx<CounterState> state;
  RxInt count;

  //============================================================================
  // Constructors
  //============================================================================

  CounterController._new() {
    state = CounterState.initial().obs;
    count = state.value.count.obs;
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() => state.value = state.value.decrementNew();

  void increment() => state.value = state.value.incrementNew();
}