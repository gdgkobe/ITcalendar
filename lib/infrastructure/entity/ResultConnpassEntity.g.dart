// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultConnpassEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultConnpassEntity _$ResultConnpassEntityFromJson(Map<String, dynamic> json) {
  return ResultConnpassEntity(
      json['results_returned'] as int,
      json['results_available'] as int,
      json['results_start'] as int,
      (json['events'] as List)
          ?.map((e) => e == null
              ? null
              : EventEntity.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultConnpassEntityToJson(
        ResultConnpassEntity instance) =>
    <String, dynamic>{
      'results_returned': instance.resultsReturned,
      'results_available': instance.resultsAvailable,
      'results_start': instance.resultsStart,
      'events': instance.events
    };
