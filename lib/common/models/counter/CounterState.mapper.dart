// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'CounterState.dart';

class CounterStateMapper extends ClassMapperBase<CounterState> {
  CounterStateMapper._();

  static CounterStateMapper? _instance;
  static CounterStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CounterStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CounterState';

  static int _$count(CounterState v) => v.count;
  static const Field<CounterState, int> _f$count =
      Field('count', _$count, opt: true, def: 0);

  @override
  final MappableFields<CounterState> fields = const {
    #count: _f$count,
  };

  static CounterState _instantiate(DecodingData data) {
    return CounterState(count: data.dec(_f$count));
  }

  @override
  final Function instantiate = _instantiate;

  static CounterState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CounterState>(map);
  }

  static CounterState fromJson(String json) {
    return ensureInitialized().decodeJson<CounterState>(json);
  }
}

mixin CounterStateMappable {
  String toJson() {
    return CounterStateMapper.ensureInitialized()
        .encodeJson<CounterState>(this as CounterState);
  }

  Map<String, dynamic> toMap() {
    return CounterStateMapper.ensureInitialized()
        .encodeMap<CounterState>(this as CounterState);
  }

  CounterStateCopyWith<CounterState, CounterState, CounterState> get copyWith =>
      _CounterStateCopyWithImpl(this as CounterState, $identity, $identity);
  @override
  String toString() {
    return CounterStateMapper.ensureInitialized()
        .stringifyValue(this as CounterState);
  }

  @override
  bool operator ==(Object other) {
    return CounterStateMapper.ensureInitialized()
        .equalsValue(this as CounterState, other);
  }

  @override
  int get hashCode {
    return CounterStateMapper.ensureInitialized()
        .hashValue(this as CounterState);
  }
}

extension CounterStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CounterState, $Out> {
  CounterStateCopyWith<$R, CounterState, $Out> get $asCounterState =>
      $base.as((v, t, t2) => _CounterStateCopyWithImpl(v, t, t2));
}

abstract class CounterStateCopyWith<$R, $In extends CounterState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? count});
  CounterStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CounterStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CounterState, $Out>
    implements CounterStateCopyWith<$R, CounterState, $Out> {
  _CounterStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CounterState> $mapper =
      CounterStateMapper.ensureInitialized();
  @override
  $R call({int? count}) =>
      $apply(FieldCopyWithData({if (count != null) #count: count}));
  @override
  CounterState $make(CopyWithData data) =>
      CounterState(count: data.get(#count, or: $value.count));

  @override
  CounterStateCopyWith<$R2, CounterState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CounterStateCopyWithImpl($value, $cast, t);
}
