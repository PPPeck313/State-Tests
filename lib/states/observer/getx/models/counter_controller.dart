import 'package:get/get.dart';
import 'package:state_tests/common/models/counter/counter_state.dart';
import 'package:state_tests/states/counter_view_model.dart';

class CounterController extends GetxController with CounterViewModelBehavior {
  final Rx<CounterState> _xState;

  @override
  CounterState get state => _xState.value;

  @override
  set state(CounterState value) => _xState.value = value;

  CounterController([CounterState state = const CounterState()]) : _xState = state.obs;
}
