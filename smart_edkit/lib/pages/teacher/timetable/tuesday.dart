import 'package:flutter/material.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';


class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();
  }

  _scheduleNotification() async {
    int notificationId = await ScheduledNotifications.scheduleNotification(
        new DateTime.now().add(new Duration(seconds: 1)).millisecondsSinceEpoch,
        "Ticker text",
        "Content title",
        "Content");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
            child: new RaisedButton(
          onPressed: _scheduleNotification,
          child: new Text('Schedule notification in 5 seconds'),
        )));
  }
}