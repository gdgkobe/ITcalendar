import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel, WeekDay;
import 'package:it_calendar/FAB.dart';
import 'package:it_calendar/List.dart';
import 'package:it_calendar/it_calendar_map.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ITカレンダー',
      home: new MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime.now();
  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  Map<DateTime, int> _markedDateMap = {
    DateTime(2018, 11, 18) : 2,
    DateTime(2018, 11, 19) : 1,
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ITカレンダー'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel(
          onDayPressed: (DateTime date) {
            print("datepressed");
            navigateListScreen();
          },
          selectedDayBorderColor: Colors.amber,
          iconColor: Colors.black,
          weekFormat: false,
          weekends: [WeekDay.Sunday, WeekDay.Saturday],
          markedDatesMap: _markedDateMap,
          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: null,
        ),
      ),
      floatingActionButton: new FloatingActionButton(child: Icon(Icons.search), onPressed: () => navigateSearchScreen(),)
    );
  }

  navigateListScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListScreen()),
    );
  }

  navigateSearchScreen() {
    ITCalendarMap.instance.showMap();
  }
}
