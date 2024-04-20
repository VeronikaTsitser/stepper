import 'package:stepper/features/stepper/domain/models/step_model.dart';

int getSteps(List<StepModel> allSteps, int step) {
  int steps = 0;
  if (allSteps.isNotEmpty) {
    for (int i = 0; i < allSteps.length - 1; i++) {
      if (allSteps[i].isPaused == false) {
        steps += allSteps[i + 1].step - allSteps[i].step;
      }
    }
    if (allSteps.last.isPaused == false) {
      steps += step - allSteps.last.step;
    }
  }
  return steps;
}
