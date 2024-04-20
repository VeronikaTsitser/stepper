// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pedometer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PedometerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int steps) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int steps)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int steps)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PedometerStarted value) started,
    required TResult Function(PedometerChanged value) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PedometerStarted value)? started,
    TResult? Function(PedometerChanged value)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PedometerStarted value)? started,
    TResult Function(PedometerChanged value)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PedometerEventCopyWith<$Res> {
  factory $PedometerEventCopyWith(
          PedometerEvent value, $Res Function(PedometerEvent) then) =
      _$PedometerEventCopyWithImpl<$Res, PedometerEvent>;
}

/// @nodoc
class _$PedometerEventCopyWithImpl<$Res, $Val extends PedometerEvent>
    implements $PedometerEventCopyWith<$Res> {
  _$PedometerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PedometerStartedImplCopyWith<$Res> {
  factory _$$PedometerStartedImplCopyWith(_$PedometerStartedImpl value,
          $Res Function(_$PedometerStartedImpl) then) =
      __$$PedometerStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PedometerStartedImplCopyWithImpl<$Res>
    extends _$PedometerEventCopyWithImpl<$Res, _$PedometerStartedImpl>
    implements _$$PedometerStartedImplCopyWith<$Res> {
  __$$PedometerStartedImplCopyWithImpl(_$PedometerStartedImpl _value,
      $Res Function(_$PedometerStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PedometerStartedImpl implements PedometerStarted {
  const _$PedometerStartedImpl();

  @override
  String toString() {
    return 'PedometerEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PedometerStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int steps) changed,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int steps)? changed,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int steps)? changed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PedometerStarted value) started,
    required TResult Function(PedometerChanged value) changed,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PedometerStarted value)? started,
    TResult? Function(PedometerChanged value)? changed,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PedometerStarted value)? started,
    TResult Function(PedometerChanged value)? changed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class PedometerStarted implements PedometerEvent {
  const factory PedometerStarted() = _$PedometerStartedImpl;
}

/// @nodoc
abstract class _$$PedometerChangedImplCopyWith<$Res> {
  factory _$$PedometerChangedImplCopyWith(_$PedometerChangedImpl value,
          $Res Function(_$PedometerChangedImpl) then) =
      __$$PedometerChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int steps});
}

/// @nodoc
class __$$PedometerChangedImplCopyWithImpl<$Res>
    extends _$PedometerEventCopyWithImpl<$Res, _$PedometerChangedImpl>
    implements _$$PedometerChangedImplCopyWith<$Res> {
  __$$PedometerChangedImplCopyWithImpl(_$PedometerChangedImpl _value,
      $Res Function(_$PedometerChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
  }) {
    return _then(_$PedometerChangedImpl(
      null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PedometerChangedImpl implements PedometerChanged {
  const _$PedometerChangedImpl(this.steps);

  @override
  final int steps;

  @override
  String toString() {
    return 'PedometerEvent.changed(steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PedometerChangedImpl &&
            (identical(other.steps, steps) || other.steps == steps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, steps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PedometerChangedImplCopyWith<_$PedometerChangedImpl> get copyWith =>
      __$$PedometerChangedImplCopyWithImpl<_$PedometerChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int steps) changed,
  }) {
    return changed(steps);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int steps)? changed,
  }) {
    return changed?.call(steps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int steps)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(steps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PedometerStarted value) started,
    required TResult Function(PedometerChanged value) changed,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PedometerStarted value)? started,
    TResult? Function(PedometerChanged value)? changed,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PedometerStarted value)? started,
    TResult Function(PedometerChanged value)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class PedometerChanged implements PedometerEvent {
  const factory PedometerChanged(final int steps) = _$PedometerChangedImpl;

  int get steps;
  @JsonKey(ignore: true)
  _$$PedometerChangedImplCopyWith<_$PedometerChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PedometerState {
  int get steps => throw _privateConstructorUsedError;
  bool get isInitialized => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PedometerStateCopyWith<PedometerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PedometerStateCopyWith<$Res> {
  factory $PedometerStateCopyWith(
          PedometerState value, $Res Function(PedometerState) then) =
      _$PedometerStateCopyWithImpl<$Res, PedometerState>;
  @useResult
  $Res call({int steps, bool isInitialized});
}

/// @nodoc
class _$PedometerStateCopyWithImpl<$Res, $Val extends PedometerState>
    implements $PedometerStateCopyWith<$Res> {
  _$PedometerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? isInitialized = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentPedometerStateImplCopyWith<$Res>
    implements $PedometerStateCopyWith<$Res> {
  factory _$$CurrentPedometerStateImplCopyWith(
          _$CurrentPedometerStateImpl value,
          $Res Function(_$CurrentPedometerStateImpl) then) =
      __$$CurrentPedometerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int steps, bool isInitialized});
}

/// @nodoc
class __$$CurrentPedometerStateImplCopyWithImpl<$Res>
    extends _$PedometerStateCopyWithImpl<$Res, _$CurrentPedometerStateImpl>
    implements _$$CurrentPedometerStateImplCopyWith<$Res> {
  __$$CurrentPedometerStateImplCopyWithImpl(_$CurrentPedometerStateImpl _value,
      $Res Function(_$CurrentPedometerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? isInitialized = null,
  }) {
    return _then(_$CurrentPedometerStateImpl(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CurrentPedometerStateImpl implements CurrentPedometerState {
  const _$CurrentPedometerStateImpl(
      {required this.steps, required this.isInitialized});

  @override
  final int steps;
  @override
  final bool isInitialized;

  @override
  String toString() {
    return 'PedometerState(steps: $steps, isInitialized: $isInitialized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPedometerStateImpl &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized));
  }

  @override
  int get hashCode => Object.hash(runtimeType, steps, isInitialized);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentPedometerStateImplCopyWith<_$CurrentPedometerStateImpl>
      get copyWith => __$$CurrentPedometerStateImplCopyWithImpl<
          _$CurrentPedometerStateImpl>(this, _$identity);
}

abstract class CurrentPedometerState implements PedometerState {
  const factory CurrentPedometerState(
      {required final int steps,
      required final bool isInitialized}) = _$CurrentPedometerStateImpl;

  @override
  int get steps;
  @override
  bool get isInitialized;
  @override
  @JsonKey(ignore: true)
  _$$CurrentPedometerStateImplCopyWith<_$CurrentPedometerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
