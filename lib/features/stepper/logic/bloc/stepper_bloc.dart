import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stepper/features/stepper/domain/models/step_model.dart';
import 'package:stepper/features/stepper/domain/stepper_repository.dart';

part 'stepper_bloc.freezed.dart';
part 'stepper_event.dart';
part 'stepper_state.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  final StepperRepository repository;
  StepperBloc(this.repository) : super(const StepperState(allSteps: [])) {
    on<PauseResumeTracking>(onToggleEvent);
  }

  Future<void> onToggleEvent(PauseResumeTracking event, Emitter<StepperState> emit) async {
    final allSteps = await repository.getAllSteps();
    final newStep = StepModel(
        step: event.steps, date: DateTime.now(), isPaused: allSteps.isNotEmpty ? !allSteps.last.isPaused : false);
    final newAllSteps = [...allSteps, newStep];

    await repository.setAllSteps(newAllSteps);
    emit(StepperState(allSteps: newAllSteps));
  }
}
