import 'package:dart_mappable/dart_mappable.dart';

part 'CounterState.mapper.dart';

//needs to be a new object for Binder, Bloc, Cubit, Command, RiverPod
@MappableClass()
class CounterState with CounterStateMappable {

  //============================================================================
  // Fields
  //============================================================================

  int count;

  //============================================================================
  // Constructors
  //============================================================================

  CounterState({this.count = 0});

  //============================================================================
  // Instance Methods
  //============================================================================

  void increment() => ++count;
  CounterState incrementNew() => copyWith(count: ++count);

  void decrement() => --count;
  CounterState decrementNew() => copyWith(count: --count);
}