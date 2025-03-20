import 'package:mobx/mobx.dart';

part 'CounterStoreX.g.dart';

class CounterStoreXWrapper {
  static final CounterStoreXWrapper _instance = CounterStoreXWrapper._new(CounterStoreX());

  factory CounterStoreXWrapper() => _instance;

  CounterStoreX counterStoreX;

  CounterStoreXWrapper._new(this.counterStoreX);
}

class CounterStoreX = CounterStoreXBase with _$CounterStoreX;

abstract class CounterStoreXBase with Store {
  @observable
  int count = 0;

  @action
  void decrement() {
    --count;
  }

  @action
  void increment() {
    ++count;
  }
}
