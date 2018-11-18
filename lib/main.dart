import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;



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
  DateTime _currentDate = DateTime(2018, 8, 1);
  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  Map<DateTime, int> _markedDateMap = {
    DateTime(2018, 9, 20) : 4,
    DateTime(2018, 10, 11) : 1,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel(
        onDayPressed: (DateTime date) {
          this.setState(() => _currentDate = date);
        },
        thisMonthDayBorderColor: Colors.grey,
        height: 420.0,
        selectedDateTime: _currentDate,
        daysHaveCircularBorder: null,
        markedDatesMap: _markedDateMap,
      ),
    );
  }
}