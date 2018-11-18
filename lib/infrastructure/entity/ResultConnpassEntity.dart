import 'package:it_calendar/infrastructure/entity/EventEntity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResultConnpassEntity.g.dart';

@JsonSerializable()
class ResultConnpassEntity {
  @JsonKey(name: 'results_returned')
  final int resultsReturned;
  @JsonKey(name: 'results_available')
  final int resultsAvailable;
  @JsonKey(name: 'results_start')
  final int resultsStart;

  @JsonKey(name: 'events')
  final List<EventEntity> events;


  ResultConnpassEntity(this.resultsReturned, this.resultsAvailable,
      this.resultsStart, this.events);

  factory ResultConnpassEntity.fromJson(Map<String, dynamic> json) =>
      _$ResultConnpassEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResultConnpassEntityToJson(this);
}
