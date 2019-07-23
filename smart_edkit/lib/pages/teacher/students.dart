import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}