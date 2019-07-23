import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}