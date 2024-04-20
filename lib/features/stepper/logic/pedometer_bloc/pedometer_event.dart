part of 'pedometer_bloc.dart';

@freezed
class PedometerEvent with _$PedometerEvent {
  const factory PedometerEvent.started() = PedometerStarted;
  const factory PedometerEvent.changed(int steps) = PedometerChanged;
}
