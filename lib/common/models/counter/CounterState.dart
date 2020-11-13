import 'package:equatable/equatable.dart';

//needs to be a new object for Binder, Bloc, Cubit, Command, RiverPod
class CounterState extends Equatable {

  //============================================================================
  // Fields
  //============================================================================

  int count;

  //============================================================================
  // Constructors
  //============================================================================

  CounterState(this.count);

  CounterState.initial() : count = 0;

  CounterState copyWith(int count) {
    return CounterState(count);
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  void increment() {
    ++count;
  }

  CounterState incrementNew() {
    int copiedCount = count;
    return copyWith(++copiedCount);
  }



  void decrement() {
    --count;
  }

  CounterState decrementNew() {
    int copiedCount = count;
    return copyWith(--copiedCount);
  }

  //============================================================================
  // Equatable Methods
  //============================================================================

  @override
  List<Object> get props => [count];

  @override
  bool get stringify => true;
}