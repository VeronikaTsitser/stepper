import 'package:stepper/features/stepper/domain/models/step_model.dart';

int getSteps(List<StepModel> allSteps, int step) {
  int steps = 0;

  if (allSteps.isNotEmpty) {
    List<StepModel> sortedSteps = [...allSteps];
    sortedSteps.sort((a, b) => a.date.compareTo(b.date));

    for (int i = 0; i < sortedSteps.length - 1; i++) {
      if (sortedSteps[i].isPaused == false) {
        steps += sortedSteps[i + 1].step - sortedSteps[i].step;
      }
    }
    if (sortedSteps.last.isPaused == false) {
      steps += step - sortedSteps.last.step;
    }
  }
  return steps;
}
