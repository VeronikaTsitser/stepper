import 'package:stepper/features/stepper/domain/models/step_model.dart';

abstract class StepperRepository {
  Future<void> setAllSteps(List<StepModel> steps);
  Future<List<StepModel>> getAllSteps();
}
