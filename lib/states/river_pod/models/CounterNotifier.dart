import 'package:flutter_riverpod/all.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterNotifier extends StateNotifier<CounterState> {
  //============================================================================
  // Static Fields
  //============================================================================

  static StateNotifierProvider<CounterNotifier> counterProvider =
      StateNotifierProvider((ref) => CounterNotifier());

  static final CounterNotifier _instance = CounterNotifier._new();

  factory CounterNotifier() => _instance;

  //============================================================================
  // Constructors
  //============================================================================

  CounterNotifier._new() : super(CounterState.initial());

  //============================================================================
  // StateNotifier Methods
  //============================================================================

  //To listen for entire app open without putting at root
  @override
  void dispose() {}

  void manualDispose() {
    super.dispose();
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() => state = state.decrementNew();

  void increment() => state = state.incrementNew();
}
