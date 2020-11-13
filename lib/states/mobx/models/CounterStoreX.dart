import 'package:mobx/mobx.dart';

part 'CounterStoreX.g.dart';

class CounterStoreX = CounterStoreXBase with _$CounterStoreX;

abstract class CounterStoreXBase with Store {

  //============================================================================
  // Fields
  //============================================================================

  @observable
  int count = 0;

  //============================================================================
  // Instance Methods
  //============================================================================

  @action
  void decrement() {
    --count;
  }

  @action
  void increment() {
    ++count;
  }
}