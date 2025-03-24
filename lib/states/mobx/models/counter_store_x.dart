import 'package:mobx/mobx.dart';

import '../../../common/models/counter/counter_state.dart';
import '../../../common/models/counter/counter_view_model.dart';

part 'counter_store_x.g.dart';

class CounterStoreX = CounterStoreXBase with _$CounterStoreX;

abstract class CounterStoreXBase with Store implements BaseCounterViewModel {
  @observable
  @override
  CounterState state;

  CounterStoreXBase([this.state = const CounterState()]);

  @action
  @override
  void decrement() => state = state.decrement();

  @action
  @override
  void increment() => state = state.increment();
}
