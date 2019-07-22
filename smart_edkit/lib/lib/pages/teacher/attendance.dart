import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}