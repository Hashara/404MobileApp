import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//mport 'package:sedkit/main.dart' as prefix0;
import 'package:sedkit/pages/teacher/timetable/monday.dart';
import 'package:sedkit/pages/teacher/timetable/tuesday.dart';
import 'package:sedkit/pages/teacher/timetable/wednsday.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Mon',
                ),
                Tab(
                  text: 'Tue',
                ),
                Tab(
                  text: 'Wed',
                ),
                Tab(
                  text: 'Thu',
                ),
                Tab(
                  text: 'Fri',
                ),
              ],
            ),
            title: Text('Time Table'),
          ),
          body: TabBarView(
            children: [
              MyApp(),
              MyHomePage(),
              WedPage(),
              //Icon(Icons.directions_transit),
              //Icon(Icons.directions_transit),
              //Icon(Icons.directions_bike),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      
    );
  }
}