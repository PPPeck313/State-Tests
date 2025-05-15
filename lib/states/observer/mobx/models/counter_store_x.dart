import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/states/counter_view_model.dart';

part 'counter_store_x.g.dart';

class CounterStoreX = CounterStoreXBase with _$CounterStoreX;

abstract class CounterStoreXBase with Store, CounterViewModelBehavior {
  @protected
  @observable
  @override
  CounterState state;

  CounterStoreXBase([this.state = const CounterState()]);
}
