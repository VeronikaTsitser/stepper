part of 'stepper_bloc.dart';

@freezed
class StepperEvent with _$StepperEvent {
  const factory StepperEvent.started() = StepperStarted;
  const factory StepperEvent.toggleTracking({required int steps}) = PauseResumeTracking;
}
