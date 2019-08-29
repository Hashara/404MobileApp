import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sedkit/pages/teacher/students/databaseConnections/studentGetter.dart';

class ClassGetter extends StatefulWidget {
  const ClassGetter({Key key, this.userid,this.schoolid}) : super(key: key);
  final String userid;
  final String schoolid;
  @override
  _ClassGetterState createState() => _ClassGetterState();
}

class _ClassGetterState extends State<ClassGetter> {

  String userid;
  String schoolid;
  String gClass;
   

  @override
  void initState() {
      super.initState();
      userid = widget.userid;
      schoolid=widget.schoolid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      // ),
  
     
     body: StreamBuilder<DocumentSnapshot>(//working
        stream: Firestore.instance
            .collection('school')
            .document(schoolid)
            .collection('teachers')
            .document(userid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            
              gClass=snapshot.data['class'];
              return getClass();
              //print(gClass);
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }

   Widget getClass()
  {
    return new StudentGetter(userid:userid,gClass: gClass,schoolid: schoolid);
  }
}