import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:it_calendar/domain/model/Event.dart';
import 'package:it_calendar/domain/model/EventList.dart';
import 'package:it_calendar/infrastructure/entity/ResultConnpassEntity.dart';

class ConnpassDataSource {
  static String url = "https://connpass.com/api/v1/event/";

  EventTranslator _eventTranslator = EventTranslator();

  Future<EventList> fetchEventList() {
    var client = http.Client();
    return client.get(url).then((response) {
      final parsed = jsonDecode(response.body);
      ResultConnpassEntity resultConnpassEntity =
      ResultConnpassEntity.fromJson(parsed);

      return _eventTranslator.toModel(resultConnpassEntity);
    });
  }

  Future<Event> fetchEvent(int eventId) {
    var client = http.Client();
    return client.get("${url}?event_id=$eventId").then((response) {
      final parsed = jsonDecode(response.body);
      ResultConnpassEntity resultConnpassEntity =
      ResultConnpassEntity.fromJson(parsed);

      return _eventTranslator
          .toModel(resultConnpassEntity)
          .events
          .first;
    });
  }
}

class EventTranslator {
  EventList toModel(ResultConnpassEntity resultConnpassEntity) {
    return EventList(
        events: resultConnpassEntity.events.map((eventEntity) {
          return Event(
            eventId: eventEntity.eventId,
            title: eventEntity.title,
            description: eventEntity.description,
            eventUrl: eventEntity.eventUrl,
            startedAt: eventEntity.startedAt,
            endedAt: eventEntity.endedAt,
            latitude: eventEntity.latitude != null
                ? double.parse(eventEntity.latitude)
                : null,
            longitude: eventEntity.longitude != null
                ? double.parse(eventEntity.longitude)
                : null,
          );
        }).toList());
  }
}
