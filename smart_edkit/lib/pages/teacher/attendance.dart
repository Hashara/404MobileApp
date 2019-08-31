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
     Color gradientStart = Color(0XFFA2A2A6); 
    // Color gradientEnd =  Color(0XFF0C0C42); 
    Color gradientEnd =  Color(0XFFFFFFFF); 
    double height = MediaQuery.of(context).size.height;

   return new Scaffold(
        appBar: new AppBar(
          title: new Text('My attendance'),
        ),
        body: 
              //Center(child: Text('Clean Calendar')),
              Container(
                  decoration: new BoxDecoration(
                  gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
                      begin: const FractionalOffset(0.5, 0.0),
                      end: const FractionalOffset(0.0, 0.5),
                      stops: [0.0,1.0],
                      tileMode: TileMode.mirror
                  ),
                ),
                // margin: EdgeInsets.all(16.0),
                // color: Colors.white,
                height: height,
                child: CleanCalendarExample(),
              ), //
            
        );
  }
}