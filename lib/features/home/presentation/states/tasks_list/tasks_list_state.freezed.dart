// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TasksListState {
  Option<Failure> get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<Tasks> get tasksList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksListStateCopyWith<TasksListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksListStateCopyWith<$Res> {
  factory $TasksListStateCopyWith(
          TasksListState value, $Res Function(TasksListState) then) =
      _$TasksListStateCopyWithImpl<$Res, TasksListState>;
  @useResult
  $Res call({Option<Failure> failure, bool isLoading, List<Tasks> tasksList});
}

/// @nodoc
class _$TasksListStateCopyWithImpl<$Res, $Val extends TasksListState>
    implements $TasksListStateCopyWith<$Res> {
  _$TasksListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? isLoading = null,
    Object? tasksList = null,
  }) {
    return _then(_value.copyWith(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tasksList: null == tasksList
          ? _value.tasksList
          : tasksList // ignore: cast_nullable_to_non_nullable
              as List<Tasks>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TasksListStateImplCopyWith<$Res>
    implements $TasksListStateCopyWith<$Res> {
  factory _$$TasksListStateImplCopyWith(_$TasksListStateImpl value,
          $Res Function(_$TasksListStateImpl) then) =
      __$$TasksListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Option<Failure> failure, bool isLoading, List<Tasks> tasksList});
}

/// @nodoc
class __$$TasksListStateImplCopyWithImpl<$Res>
    extends _$TasksListStateCopyWithImpl<$Res, _$TasksListStateImpl>
    implements _$$TasksListStateImplCopyWith<$Res> {
  __$$TasksListStateImplCopyWithImpl(
      _$TasksListStateImpl _value, $Res Function(_$TasksListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? isLoading = null,
    Object? tasksList = null,
  }) {
    return _then(_$TasksListStateImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tasksList: null == tasksList
          ? _value._tasksList
          : tasksList // ignore: cast_nullable_to_non_nullable
              as List<Tasks>,
    ));
  }
}

/// @nodoc

class _$TasksListStateImpl implements _TasksListState {
  const _$TasksListStateImpl(
      {required this.failure,
      required this.isLoading,
      required final List<Tasks> tasksList})
      : _tasksList = tasksList;

  @override
  final Option<Failure> failure;
  @override
  final bool isLoading;
  final List<Tasks> _tasksList;
  @override
  List<Tasks> get tasksList {
    if (_tasksList is EqualUnmodifiableListView) return _tasksList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasksList);
  }

  @override
  String toString() {
    return 'TasksListState(failure: $failure, isLoading: $isLoading, tasksList: $tasksList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksListStateImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._tasksList, _tasksList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, isLoading,
      const DeepCollectionEquality().hash(_tasksList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksListStateImplCopyWith<_$TasksListStateImpl> get copyWith =>
      __$$TasksListStateImplCopyWithImpl<_$TasksListStateImpl>(
          this, _$identity);
}

abstract class _TasksListState implements TasksListState {
  const factory _TasksListState(
      {required final Option<Failure> failure,
      required final bool isLoading,
      required final List<Tasks> tasksList}) = _$TasksListStateImpl;

  @override
  Option<Failure> get failure;
  @override
  bool get isLoading;
  @override
  List<Tasks> get tasksList;
  @override
  @JsonKey(ignore: true)
  _$$TasksListStateImplCopyWith<_$TasksListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
