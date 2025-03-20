import 'package:mobx/mobx.dart';

part 'CounterStoreX.g.dart';

class CounterStoreXWrapper {
  //============================================================================
  // Static Fields
  //============================================================================

  static final CounterStoreXWrapper _instance =
      CounterStoreXWrapper._new(CounterStoreX());

  factory CounterStoreXWrapper() => _instance;

  //============================================================================
  // Fields
  //============================================================================

  CounterStoreX counterStoreX;

  //============================================================================
  // Constructors
  //============================================================================

  CounterStoreXWrapper._new(this.counterStoreX);
}

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
