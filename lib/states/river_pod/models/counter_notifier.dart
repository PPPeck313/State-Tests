import 'package:flutter_riverpod/all.dart';
import 'package:state_tests/common/models/counter/CounterState.dart';

class CounterNotifier extends StateNotifier<CounterState> {
  static StateNotifierProvider<CounterNotifier> counterProvider = StateNotifierProvider((ref) => CounterNotifier());

  static final CounterNotifier _instance = CounterNotifier._new();

  factory CounterNotifier() => _instance;

  CounterNotifier._new() : super(CounterState.initial());

  //To listen for entire app open without putting at root
  @override
  void dispose() {}

  void manualDispose() {
    super.dispose();
  }

  void decrement() => state = state.decrementNew();

  void increment() => state = state.incrementNew();
}
