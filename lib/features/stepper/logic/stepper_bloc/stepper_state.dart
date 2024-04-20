part of 'stepper_bloc.dart';

@freezed
class StepperState with _$StepperState {
  const StepperState._();
  const factory StepperState({
    required List<StepModel> allSteps,
    required int walkingTime,
  }) = _StepperState;
}
