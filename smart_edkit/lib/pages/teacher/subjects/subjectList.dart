import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SubjectListPage extends StatefulWidget {
  const SubjectListPage({Key key, this.user}) : super(key: key);
  final String user;
  @override
  _SubjectListPageState createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
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
        title: Text('Notes'),
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
            return Text('${snapshot.data['subjects']} ');
          }
          return LinearProgressIndicator();
        },
      ),
  
    );
  }
  

}