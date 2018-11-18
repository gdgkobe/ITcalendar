import 'package:it_calendar/domain/model/Event.dart';
import 'package:it_calendar/infrastructure/datasource/ConnpassDataSource.dart';

class FetchDetailEvent {

  ConnpassDataSource _connpassDataSource = ConnpassDataSource();

  FetchDetailEvent() {

  }

  Future<Event> execute(Event event) {
    _connpassDataSource.fetchEventList();
  }


}