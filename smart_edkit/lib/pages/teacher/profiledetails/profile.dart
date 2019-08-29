import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sedkit/pages/teacher/profiledetails/profileUI.dart';

class ProfileTeacherPage extends StatefulWidget {
  const ProfileTeacherPage({Key key, this.userid,this.schoolid}) : super(key: key);
  final String userid;
  final String schoolid;
  @override
  _ProfileTeacherPageState createState() => _ProfileTeacherPageState();
}

class _ProfileTeacherPageState extends State<ProfileTeacherPage> {

  String userid;
  String schoolid;
  String address;
  DateTime birthday;
  String gClass;
  String contactnumber;
  String gender;
  String name;
  String nic;  

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
        title: Text('Profile'),
      ),
  
     
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
            
              address=snapshot.data['address'];
              birthday=snapshot.data['birthday'].toDate();
              gClass=snapshot.data['class'];
              contactnumber=snapshot.data['contact_number'];
              gender=snapshot.data['gender'];
              name=snapshot.data['name'];
              nic=snapshot.data['nic'];
              return getProfilePage();
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }

   Widget getProfilePage()
  {
    return new ProfileUipage(address:address,birthday:birthday,contactnumber:contactnumber,gClass:gClass,gender:gender,name:name,nic:nic);
  }
}