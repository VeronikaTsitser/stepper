import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepper/features/stepper/domain/models/step_model.dart';
import 'package:stepper/features/stepper/domain/stepper_repository.dart';

class StepperRepositoryImpl implements StepperRepository {
  @override
  Future<List<StepModel>> getAllSteps() async {
    final preferences = await SharedPreferences.getInstance();
    final allStepsString = preferences.getStringList('allSteps') ?? [];
    return allStepsString.map((e) => StepModel.fromJson(jsonDecode(e))).toList();
  }

  @override
  Future<void> setAllSteps(List<StepModel> steps) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('allSteps', steps.map((e) => jsonEncode(e.toJson())).toList());
  }
}
