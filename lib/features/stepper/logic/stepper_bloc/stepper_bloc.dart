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
  StepperBloc(this.repository) : super(const StepperState(allSteps: [], walkingTime: 0)) {
    on<PauseResumeTracking>(onToggleTrackingEvent);
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
    for (int i = 0; i < newAllSteps.length - 1; i++) {
      if (!newAllSteps[i].isPaused) {
        walkingTime += newAllSteps[i + 1].date.difference(newAllSteps[i].date).inSeconds;
      }
    }
    emit(StepperState(allSteps: [...currentDaySteps, newStep], walkingTime: walkingTime));
  }
}

extension DateTimeExtensions on DateTime {
  /// Возвращает DateTime на начало текущего дня (00:00:00)
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }
}
