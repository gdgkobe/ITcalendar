import 'package:flutter/material.dart';
import 'package:it_calendar/domain/model/Event.dart';

class EventDetailPage extends StatefulWidget {
  EventDetailPage({Key key, this.title, this.event}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final Event event;

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {

  void _openLink() {
    // TODO: リンク開く
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget> [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.event.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                ),
                background: Image.network(
                  "https://connpass.com/static/img/common/sitelogo_295x100.png",
                  fit: BoxFit.cover,
                  color: Color.fromRGBO(163, 51, 24, 1.0),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Center(
            child: Text(widget.event.description,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openLink,
        tooltip: 'Increment',
        child: Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}