// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) {
  return EventEntity(
      json['event_id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['event_url'] as String,
      json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      json['ended_at'] == null
          ? null
          : DateTime.parse(json['ended_at'] as String),
      json['lat'] as String,
      json['lon'] as String);
}

Map<String, dynamic> _$EventEntityToJson(EventEntity instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'title': instance.title,
      'description': instance.description,
      'event_url': instance.eventUrl,
      'started_at': instance.startedAt?.toIso8601String(),
      'ended_at': instance.endedAt?.toIso8601String(),
      'lat': instance.latitude,
      'lon': instance.longitude
    };
