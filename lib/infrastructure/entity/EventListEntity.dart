import 'package:it_calendar/infrastructure/entity/EventEntity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'EventListEntity.g.dart';

@JsonSerializable()
class EventListEntity {
  @JsonKey(name: 'events')
  final List<EventEntity> events;


  EventListEntity({this.events});

  factory EventListEntity.fromJson(Map<String, dynamic> json) =>
      _$EventListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EventListEntityToJson(this);
}
