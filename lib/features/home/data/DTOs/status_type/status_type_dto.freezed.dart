// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_type_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatusTypeDto _$StatusTypeDtoFromJson(Map<String, dynamic> json) {
  return _StatusTypeDto.fromJson(json);
}

/// @nodoc
mixin _$StatusTypeDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusTypeDtoCopyWith<StatusTypeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusTypeDtoCopyWith<$Res> {
  factory $StatusTypeDtoCopyWith(
          StatusTypeDto value, $Res Function(StatusTypeDto) then) =
      _$StatusTypeDtoCopyWithImpl<$Res, StatusTypeDto>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$StatusTypeDtoCopyWithImpl<$Res, $Val extends StatusTypeDto>
    implements $StatusTypeDtoCopyWith<$Res> {
  _$StatusTypeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusTypeDtoImplCopyWith<$Res>
    implements $StatusTypeDtoCopyWith<$Res> {
  factory _$$StatusTypeDtoImplCopyWith(
          _$StatusTypeDtoImpl value, $Res Function(_$StatusTypeDtoImpl) then) =
      __$$StatusTypeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$StatusTypeDtoImplCopyWithImpl<$Res>
    extends _$StatusTypeDtoCopyWithImpl<$Res, _$StatusTypeDtoImpl>
    implements _$$StatusTypeDtoImplCopyWith<$Res> {
  __$$StatusTypeDtoImplCopyWithImpl(
      _$StatusTypeDtoImpl _value, $Res Function(_$StatusTypeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$StatusTypeDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusTypeDtoImpl extends _StatusTypeDto {
  const _$StatusTypeDtoImpl({required this.id, required this.title})
      : super._();

  factory _$StatusTypeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusTypeDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'StatusTypeDto(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusTypeDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusTypeDtoImplCopyWith<_$StatusTypeDtoImpl> get copyWith =>
      __$$StatusTypeDtoImplCopyWithImpl<_$StatusTypeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusTypeDtoImplToJson(
      this,
    );
  }
}

abstract class _StatusTypeDto extends StatusTypeDto {
  const factory _StatusTypeDto(
      {required final int id,
      required final String title}) = _$StatusTypeDtoImpl;
  const _StatusTypeDto._() : super._();

  factory _StatusTypeDto.fromJson(Map<String, dynamic> json) =
      _$StatusTypeDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$StatusTypeDtoImplCopyWith<_$StatusTypeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
