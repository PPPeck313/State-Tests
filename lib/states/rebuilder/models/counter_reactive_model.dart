import '../../../common/models/counter/counter_state.dart';

class CounterReactiveModel {
  CounterState state;

  CounterReactiveModel(this.state);

  void decrement() => state.decrement();

  void increment() => state.increment();
  RM.inject<Counter>(
  () => Counter(0),
  // State will be redone and undone
  undoStackLength: 8,
  // Build-in logger
  debugPrintWhenNotifiedPreMessage: 'counter2',
  );
}
