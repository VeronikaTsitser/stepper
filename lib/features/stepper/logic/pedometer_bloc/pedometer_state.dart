part of 'pedometer_bloc.dart';

@freezed
class PedometerState with _$PedometerState {
  const factory PedometerState({
    required int steps,
    required bool isInitialized,
  }) = CurrentPedometerState;
}
