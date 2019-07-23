import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}