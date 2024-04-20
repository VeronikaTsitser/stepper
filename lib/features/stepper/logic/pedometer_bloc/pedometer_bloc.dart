import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pedometer/pedometer.dart';
import 'package:stepper/features/core/services/permission_service.dart';

part 'pedometer_bloc.freezed.dart';
part 'pedometer_event.dart';
part 'pedometer_state.dart';

class PedometerBloc extends Bloc<PedometerEvent, PedometerState> {
  StreamSubscription<StepCount>? _subscription;
  PedometerBloc() : super(const CurrentPedometerState(isInitialized: false, steps: 0)) {
    on<PedometerStarted>(onPedometerStarted);
    on<PedometerChanged>(onPedometerChanged);
  }

  Future<void> onPedometerStarted(PedometerStarted event, Emitter<PedometerState> emit) async {
    if (state.isInitialized) {
      return;
    }

    if (await checkActivityPermissions()) {
      _subscription ??= Pedometer.stepCountStream.listen(
        (value) => add(PedometerChanged(value.steps)),
      );
    }
  }

  void onPedometerChanged(PedometerChanged event, Emitter<PedometerState> emit) {
    emit(PedometerState(steps: event.steps, isInitialized: true));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
