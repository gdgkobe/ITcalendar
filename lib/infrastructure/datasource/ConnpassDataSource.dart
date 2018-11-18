import 'package:it_calendar/domain/model/EventList.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class ConnpassDataSource {
  static String url = "https://connpass.com/api/v1/event/";
  Future<EventList> fetchEventList() {
    var client = http.Client();
    client.get(url) .then((response) => print(response.body));
//      final parsed = jsonDecode(response.body);
//      ResultLatestReceiptEntity result =
//      ResultLatestReceiptEntity.fromJson(parsed);

  }
}