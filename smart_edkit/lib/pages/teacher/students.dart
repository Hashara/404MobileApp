import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
           return Text('${snapshot.data['students']} ');
            //  for(var i = 0;i<snapshot.data['students'].length;i++){
            //     print("Position $i : ${snapshot.data['students'][i]} ");
            //   }
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}