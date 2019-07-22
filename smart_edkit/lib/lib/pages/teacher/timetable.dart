import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}