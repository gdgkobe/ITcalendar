import 'package:flutter/material.dart';
import 'package:it_calendar/domain/model/Event.dart';
import 'package:it_calendar/domain/model/EventList.dart';
import 'package:it_calendar/view/EventDetailPage.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key, this.eventList}) : super(key: key);

  final EventList eventList;

  @override
  _LScreen createState() => new _LScreen();
}

class _LScreen extends State<ListScreen> {
  List<Event> events = [];

  @override
  void initState() {

    super.initState();
    events = widget.eventList.events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: AppConfig.kTheme.primaryColor,
        title: Text("ITカレンダーリスト"),
        elevation: 4.0,
      ),
      body: ListView.builder(
        itemCount: events != null ? events.length : 0,
        itemBuilder: (BuildContext context, int position) {
          return _getEventItem(position);
        },
      ),
    );
  }

  Widget _getEventItem(int position) {
    Event event = events[position];
    return ListTile(
//      leading:
//      ImageUtils.circle(room.photoUrl, text: room.name, fontSize: 15.0),
      title: Text(event.title),
      subtitle: Text(
        event.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      // isDisplayの使い方参考
      //trailing: widget.user.paidPlan.isDisplayAd ? Text('Ad') : Text('no'),
      onTap: () => _onTapEventListItem(event),
    );
  }


  void _onTapEventListItem(Event event) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EventDetailPage(title: event.title, event: event)),
    );
  }


}
