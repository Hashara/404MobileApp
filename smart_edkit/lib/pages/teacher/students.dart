import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sedkit/pages/teacher/students/utils/widgets.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key key, this.user}) : super(key: key);
  final String user;
  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
   String user;
 
  @override
  void initState() {
      super.initState();
      user = widget.user;
     
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
            .document(user)
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