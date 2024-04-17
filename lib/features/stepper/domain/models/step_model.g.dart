// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepModelImpl _$$StepModelImplFromJson(Map<String, dynamic> json) =>
    _$StepModelImpl(
      step: json['step'] as int,
      date: DateTime.parse(json['date'] as String),
      isPaused: json['isPaused'] as bool,
    );

Map<String, dynamic> _$$StepModelImplToJson(_$StepModelImpl instance) =>
    <String, dynamic>{
      'step': instance.step,
      'date': instance.date.toIso8601String(),
      'isPaused': instance.isPaused,
    };
