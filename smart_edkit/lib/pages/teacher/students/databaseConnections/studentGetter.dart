import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sedkit/pages/teacher/students/databaseConnections/studentDetailGetter.dart';

class StudentGetter extends StatefulWidget {
  const StudentGetter({Key key, this.userid,this.schoolid,this.gClass}) : super(key: key);
  final String userid;
  final String schoolid;
  final String gClass;
  @override
  _StudentGetterState createState() => _StudentGetterState();
}

class _StudentGetterState extends State<StudentGetter> {

  
  String userid;
  String schoolid;
  String gClass;

   @override
  void initState() {
      super.initState();
      userid = widget.userid;
      schoolid=widget.schoolid;
      gClass=widget.gClass;
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
  
     
     body: StreamBuilder<DocumentSnapshot>(//working
        stream: Firestore.instance
            .collection('school')
            .document(schoolid)
            .collection('class')
            .document(gClass)
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
  //    for (int i = 0; i < 5; i++) {
  //   print(strings[i]);
  // }
    
    Color gradientStart = Color(0XFFA2A2A6); //Change start gradient color here
    Color gradientEnd =  Color(0XFF0C0C42); 

    return new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0,1.0],
                tileMode: TileMode.mirror
            ),
          ),
          child:  SingleChildScrollView(
      child: Column(children: strings.map((student) => new StudentDetailsGetter(studentid:student,schoolid: schoolid,)).toList())));
  }
}