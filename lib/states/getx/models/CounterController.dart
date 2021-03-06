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

  // class is "reactive", but the properties inside ARE NOT!
  // `Rx` don't have any clue when you change something inside

  void decrementObject() => state.value = state.value.decrementNew();
  void decrement() => state.update((value) {
    value.count = --value.count;
  });

  void incrementObject() => state.value = state.value.incrementNew();
  void increment() {
    state.value.count = ++state.value.count;
    state.refresh();
  }
}