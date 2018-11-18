// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventListEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventListEntity _$EventListEntityFromJson(Map<String, dynamic> json) {
  return EventListEntity(
      events: (json['events'] as List)
          ?.map((e) => e == null
              ? null
              : EventEntity.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EventListEntityToJson(EventListEntity instance) =>
    <String, dynamic>{'events': instance.events};
