import 'package:json_annotation/json_annotation.dart';

part 'EventEntity.g.dart';

@JsonSerializable()
class EventEntity {
  @JsonKey(name: 'event_id', nullable: false)
  final int eventId;
  @JsonKey(name: 'title', nullable: false)
  final String title;
  @JsonKey(name: 'description', nullable: false)
  final String description;
  @JsonKey(name: 'event_url', nullable: false)
  final String eventUrl;
  @JsonKey(name: 'started_at', nullable: true)
  final DateTime startedAt;
  @JsonKey(name: 'ended_at', nullable: true)
  final DateTime endedAt;
  @JsonKey(name: 'lat', nullable: true)
  final String latitude;
  @JsonKey(name: 'lon', nullable: true)
  final String longitude;


  EventEntity(this.eventId, this.title, this.description, this.eventUrl,
      this.startedAt, this.endedAt, this.latitude, this.longitude);

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EventEntityToJson(this);
}
