import 'package:flutter_riverpod/all.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterNotifier extends StateNotifier<CounterState> {

  //============================================================================
  // Static Fields
  //============================================================================

  static final counterProvider = StateNotifierProvider((ref) => CounterNotifier());

  //============================================================================
  // Constructors
  //============================================================================

  CounterNotifier() : super(CounterState.initial());

  //============================================================================
  // Instance Methods
  //============================================================================

  void decrement() => state = state.decrementNew();

  void increment() => state = state.incrementNew();
}