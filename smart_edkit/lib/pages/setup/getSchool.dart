import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sedkit/pages/teacher/teacherhome.dart';

class School extends StatefulWidget {
  final String userid;
  //final String school;

  const School({Key key, this.userid}) : super(key: key);

  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  String userid;
  String school;
  String uid;

    @override
    void initState() {
        super.initState();
        userid = widget.userid;
        //school=widget.school;
    }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance
            .collection('usermap')
            .document(userid)
            .snapshots(),
      builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
              uid=snapshot.data['uid'];
             return getTeacherHome(snapshot.data['school']);
          }
          return new Scaffold(
             body: new Center(
              child: new CircularProgressIndicator(),
             )
            );
      }
    );
  }

    Widget getTeacherHome(String schoolid)
  {
    //return new TeacherHomePage(userid:userid,schoolid:schoolid);
    return new TeacherHomePage(userid:userid,schoolid:schoolid,uid: uid);

  }
}