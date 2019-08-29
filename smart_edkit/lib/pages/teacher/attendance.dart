import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:sedkit/pages/teacher/calender/clean_calander.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key key, this.userid,this.schoolid,this.uid}) : super(key: key);
  final String userid;
  final String schoolid;
  final String uid;
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
        appBar: new AppBar(
          title: new Text('My attendance'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              //Center(child: Text('Clean Calendar')),
              Container(
                margin: EdgeInsets.all(16.0),
                color: Colors.white,
                height: 420,
                child: CleanCalendarExample(),
              ), //
              
            ],
          ),
        ));
  }
}