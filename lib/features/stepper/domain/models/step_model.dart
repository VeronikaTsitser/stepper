import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_model.freezed.dart';
part 'step_model.g.dart';

@freezed
class StepModel with _$StepModel {
  factory StepModel({
    required int step,
    required DateTime date,
    required bool isPaused,
  }) = _StepModel;

  factory StepModel.fromJson(Map<String, dynamic> json) => _$StepModelFromJson(json);
}
