import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key key, this.user}) : super(key: key);
  final String user;
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
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
        title: Text('Home ${user}'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("user").snapshots(),
        builder: (context,snapshot){
          if (!snapshot.hasData){
            return Text('Loading');
          }else{
            return Column(
              children: <Widget>[
                Text(snapshot.data)
              ],
            );
          }
        },
      ),
    );
  }
  // Future<String> getChannelName() async {
  // DocumentSnapshot snapshot=  await Firestore.instance.collection('user').document('WXQHHnHUMQSjPjRPF3YC').get();
  // var channelName = snapshot['name'];
  // assert (channelName is String) ;
  //   return channelName;

  // }
}