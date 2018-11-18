import 'package:it_calendar/domain/model/Event.dart';
import 'package:it_calendar/infrastructure/datasource/ConnpassDataSource.dart';

class FetchDetailEventUseCase {
  ConnpassDataSource _connpassDataSource = ConnpassDataSource();

  Future<Event> execute(Event event) => _connpassDataSource.fetchEventList();
}
