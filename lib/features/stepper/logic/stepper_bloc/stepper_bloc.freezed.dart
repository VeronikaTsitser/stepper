// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stepper_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StepperEvent {
  int get steps => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int steps) toggleTracking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int steps)? toggleTracking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int steps)? toggleTracking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PauseResumeTracking value) toggleTracking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PauseResumeTracking value)? toggleTracking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PauseResumeTracking value)? toggleTracking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepperEventCopyWith<StepperEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepperEventCopyWith<$Res> {
  factory $StepperEventCopyWith(
          StepperEvent value, $Res Function(StepperEvent) then) =
      _$StepperEventCopyWithImpl<$Res, StepperEvent>;
  @useResult
  $Res call({int steps});
}

/// @nodoc
class _$StepperEventCopyWithImpl<$Res, $Val extends StepperEvent>
    implements $StepperEventCopyWith<$Res> {
  _$StepperEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PauseResumeTrackingImplCopyWith<$Res>
    implements $StepperEventCopyWith<$Res> {
  factory _$$PauseResumeTrackingImplCopyWith(_$PauseResumeTrackingImpl value,
          $Res Function(_$PauseResumeTrackingImpl) then) =
      __$$PauseResumeTrackingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int steps});
}

/// @nodoc
class __$$PauseResumeTrackingImplCopyWithImpl<$Res>
    extends _$StepperEventCopyWithImpl<$Res, _$PauseResumeTrackingImpl>
    implements _$$PauseResumeTrackingImplCopyWith<$Res> {
  __$$PauseResumeTrackingImplCopyWithImpl(_$PauseResumeTrackingImpl _value,
      $Res Function(_$PauseResumeTrackingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
  }) {
    return _then(_$PauseResumeTrackingImpl(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PauseResumeTrackingImpl implements PauseResumeTracking {
  const _$PauseResumeTrackingImpl({required this.steps});

  @override
  final int steps;

  @override
  String toString() {
    return 'StepperEvent.toggleTracking(steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseResumeTrackingImpl &&
            (identical(other.steps, steps) || other.steps == steps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, steps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseResumeTrackingImplCopyWith<_$PauseResumeTrackingImpl> get copyWith =>
      __$$PauseResumeTrackingImplCopyWithImpl<_$PauseResumeTrackingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int steps) toggleTracking,
  }) {
    return toggleTracking(steps);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int steps)? toggleTracking,
  }) {
    return toggleTracking?.call(steps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int steps)? toggleTracking,
    required TResult orElse(),
  }) {
    if (toggleTracking != null) {
      return toggleTracking(steps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PauseResumeTracking value) toggleTracking,
  }) {
    return toggleTracking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PauseResumeTracking value)? toggleTracking,
  }) {
    return toggleTracking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PauseResumeTracking value)? toggleTracking,
    required TResult orElse(),
  }) {
    if (toggleTracking != null) {
      return toggleTracking(this);
    }
    return orElse();
  }
}

abstract class PauseResumeTracking implements StepperEvent {
  const factory PauseResumeTracking({required final int steps}) =
      _$PauseResumeTrackingImpl;

  @override
  int get steps;
  @override
  @JsonKey(ignore: true)
  _$$PauseResumeTrackingImplCopyWith<_$PauseResumeTrackingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StepperState {
  List<StepModel> get allSteps => throw _privateConstructorUsedError;
  int get walkingTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepperStateCopyWith<StepperState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepperStateCopyWith<$Res> {
  factory $StepperStateCopyWith(
          StepperState value, $Res Function(StepperState) then) =
      _$StepperStateCopyWithImpl<$Res, StepperState>;
  @useResult
  $Res call({List<StepModel> allSteps, int walkingTime});
}

/// @nodoc
class _$StepperStateCopyWithImpl<$Res, $Val extends StepperState>
    implements $StepperStateCopyWith<$Res> {
  _$StepperStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSteps = null,
    Object? walkingTime = null,
  }) {
    return _then(_value.copyWith(
      allSteps: null == allSteps
          ? _value.allSteps
          : allSteps // ignore: cast_nullable_to_non_nullable
              as List<StepModel>,
      walkingTime: null == walkingTime
          ? _value.walkingTime
          : walkingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepperStateImplCopyWith<$Res>
    implements $StepperStateCopyWith<$Res> {
  factory _$$StepperStateImplCopyWith(
          _$StepperStateImpl value, $Res Function(_$StepperStateImpl) then) =
      __$$StepperStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StepModel> allSteps, int walkingTime});
}

/// @nodoc
class __$$StepperStateImplCopyWithImpl<$Res>
    extends _$StepperStateCopyWithImpl<$Res, _$StepperStateImpl>
    implements _$$StepperStateImplCopyWith<$Res> {
  __$$StepperStateImplCopyWithImpl(
      _$StepperStateImpl _value, $Res Function(_$StepperStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSteps = null,
    Object? walkingTime = null,
  }) {
    return _then(_$StepperStateImpl(
      allSteps: null == allSteps
          ? _value._allSteps
          : allSteps // ignore: cast_nullable_to_non_nullable
              as List<StepModel>,
      walkingTime: null == walkingTime
          ? _value.walkingTime
          : walkingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StepperStateImpl extends _StepperState {
  const _$StepperStateImpl(
      {required final List<StepModel> allSteps, required this.walkingTime})
      : _allSteps = allSteps,
        super._();

  final List<StepModel> _allSteps;
  @override
  List<StepModel> get allSteps {
    if (_allSteps is EqualUnmodifiableListView) return _allSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allSteps);
  }

  @override
  final int walkingTime;

  @override
  String toString() {
    return 'StepperState(allSteps: $allSteps, walkingTime: $walkingTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepperStateImpl &&
            const DeepCollectionEquality().equals(other._allSteps, _allSteps) &&
            (identical(other.walkingTime, walkingTime) ||
                other.walkingTime == walkingTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_allSteps), walkingTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepperStateImplCopyWith<_$StepperStateImpl> get copyWith =>
      __$$StepperStateImplCopyWithImpl<_$StepperStateImpl>(this, _$identity);
}

abstract class _StepperState extends StepperState {
  const factory _StepperState(
      {required final List<StepModel> allSteps,
      required final int walkingTime}) = _$StepperStateImpl;
  const _StepperState._() : super._();

  @override
  List<StepModel> get allSteps;
  @override
  int get walkingTime;
  @override
  @JsonKey(ignore: true)
  _$$StepperStateImplCopyWith<_$StepperStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
