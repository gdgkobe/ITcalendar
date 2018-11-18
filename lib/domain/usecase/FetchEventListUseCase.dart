import 'package:it_calendar/domain/model/EventList.dart';
import 'package:it_calendar/infrastructure/datasource/ConnpassDataSource.dart';

class FetchEventListUseCase {
  ConnpassDataSource _connpassDataSource = ConnpassDataSource();

  Future<EventList> execute() => _connpassDataSource.fetchEventList();
}
