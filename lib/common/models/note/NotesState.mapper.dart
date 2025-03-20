// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'NotesState.dart';

class NotesStateMapper extends ClassMapperBase<NotesState> {
  NotesStateMapper._();

  static NotesStateMapper? _instance;
  static NotesStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotesStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NotesState';

  static String _$input(NotesState v) => v.input;
  static const Field<NotesState, String> _f$input = Field('input', _$input, opt: true, def: '');
  static List<String> _$notes(NotesState v) => v.notes;
  static const Field<NotesState, List<String>> _f$notes = Field('notes', _$notes, mode: FieldMode.member);

  @override
  final MappableFields<NotesState> fields = const {#input: _f$input, #notes: _f$notes};

  static NotesState _instantiate(DecodingData data) {
    return NotesState(input: data.dec(_f$input));
  }

  @override
  final Function instantiate = _instantiate;

  static NotesState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotesState>(map);
  }

  static NotesState fromJson(String json) {
    return ensureInitialized().decodeJson<NotesState>(json);
  }
}

mixin NotesStateMappable {
  String toJson() {
    return NotesStateMapper.ensureInitialized().encodeJson<NotesState>(this as NotesState);
  }

  Map<String, dynamic> toMap() {
    return NotesStateMapper.ensureInitialized().encodeMap<NotesState>(this as NotesState);
  }

  NotesStateCopyWith<NotesState, NotesState, NotesState> get copyWith => _NotesStateCopyWithImpl(this as NotesState, $identity, $identity);
  @override
  String toString() {
    return NotesStateMapper.ensureInitialized().stringifyValue(this as NotesState);
  }

  @override
  bool operator ==(Object other) {
    return NotesStateMapper.ensureInitialized().equalsValue(this as NotesState, other);
  }

  @override
  int get hashCode {
    return NotesStateMapper.ensureInitialized().hashValue(this as NotesState);
  }
}

extension NotesStateValueCopy<$R, $Out> on ObjectCopyWith<$R, NotesState, $Out> {
  NotesStateCopyWith<$R, NotesState, $Out> get $asNotesState => $base.as((v, t, t2) => _NotesStateCopyWithImpl(v, t, t2));
}

abstract class NotesStateCopyWith<$R, $In extends NotesState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? input});
  NotesStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NotesStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, NotesState, $Out>
    implements NotesStateCopyWith<$R, NotesState, $Out> {
  _NotesStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotesState> $mapper = NotesStateMapper.ensureInitialized();
  @override
  $R call({String? input}) => $apply(FieldCopyWithData({if (input != null) #input: input}));
  @override
  NotesState $make(CopyWithData data) => NotesState(input: data.get(#input, or: $value.input));

  @override
  NotesStateCopyWith<$R2, NotesState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _NotesStateCopyWithImpl($value, $cast, t);
}
