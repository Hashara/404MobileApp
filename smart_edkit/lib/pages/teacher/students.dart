import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sedkit/pages/teacher/students/utils/widgets.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key key, this.userid,this.schoolid}) : super(key: key);
  final String userid;
  final String schoolid;
  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
   String userid;
   String schoolid;
 
  @override
  void initState() {
      super.initState();
      userid = widget.userid;
      schoolid=widget.schoolid;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
  
     
     body: StreamBuilder<DocumentSnapshot>(//working
        stream: Firestore.instance
            .collection('users')
            .document(userid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
        
             return getStudentsWidgets(snapshot.data['students']);
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }

   Widget getStudentsWidgets(List<dynamic> strings)
  {
    return new SingleChildScrollView(
      child: Column(children: strings.map((student) => new Student(studentID:student)).toList()));
  }
}