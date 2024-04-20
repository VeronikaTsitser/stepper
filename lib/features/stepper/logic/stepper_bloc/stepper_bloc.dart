import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stepper/features/stepper/domain/models/step_model.dart';
import 'package:stepper/features/stepper/domain/stepper_repository.dart';
import 'package:stepper/features/stepper/utils/utils.dart';

part 'stepper_bloc.freezed.dart';
part 'stepper_event.dart';
part 'stepper_state.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  final StepperRepository repository;
  StepperBloc(this.repository) : super(const StepperState(allSteps: [], walkingTime: 0)) {
    on<PauseResumeTracking>(onToggleTrackingEvent);
    on<StepperStarted>(onStepperStarted);
  }

  Future<void> onToggleTrackingEvent(PauseResumeTracking event, Emitter<StepperState> emit) async {
    final allSteps = await repository.getAllSteps();
    DateTime startOfToday = DateTime.now().startOfDay;
    final currentDaySteps = allSteps.where((element) => element.date.isAfter(startOfToday)).toList();
    final newStep = StepModel(
        step: event.steps,
        date: DateTime.now(),
        isPaused: currentDaySteps.isNotEmpty ? !currentDaySteps.last.isPaused : false);
    final newAllSteps = [...allSteps, newStep];
    await repository.setAllSteps(newAllSteps);
    int walkingTime = 0;
    for (int i = 0; i < currentDaySteps.length - 1; i++) {
      if (!currentDaySteps[i].isPaused) {
        walkingTime += currentDaySteps[i + 1].date.difference(currentDaySteps[i].date).inSeconds;
      }
    }
    emit(StepperState(allSteps: [...currentDaySteps, newStep], walkingTime: walkingTime));
  }

  Future<void> onStepperStarted(StepperStarted event, Emitter<StepperState> emit) async {
    final allSteps = await repository.getAllSteps();
    DateTime startOfToday = DateTime.now().startOfDay;
    final currentDaySteps = allSteps.where((element) => element.date.isAfter(startOfToday)).toList();
    int walkingTime = 0;
    for (int i = 0; i < currentDaySteps.length - 1; i++) {
      if (!currentDaySteps[i].isPaused) {
        walkingTime += currentDaySteps[i + 1].date.difference(currentDaySteps[i].date).inSeconds;
      }
    }
    emit(StepperState(allSteps: currentDaySteps, walkingTime: walkingTime));
  }
}
