import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sedkit/pages/teacher/students/utils/profile.dart';

class Student extends StatefulWidget {
  final String studentID;

  Student({this.studentID});
  @override
  _StudenttState createState() => _StudenttState();
}

class _StudenttState extends State<Student> {
  String studentID;
  String name;
  String classname;
  String contactnum;
  String gender;
  DateTime birthday;
  @override
  void initState() {
      super.initState();
      studentID = widget.studentID;
    }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,  
        children: <Widget>[
          StreamBuilder<DocumentSnapshot>(
            stream:Firestore.instance
            .collection('students')
            .document(studentID)
            .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    classname=snapshot.data['class'];
                    contactnum=snapshot.data['parent contact number'];
                    name=snapshot.data['name'];
                    gender=snapshot.data['gender'];
                    birthday=snapshot.data['birthday'].toDate();;
                    return FlatButton(
                    child:Row(
                      
                      children: <Widget>[
                         new Container(
                            alignment: Alignment.centerLeft,
                            margin: new EdgeInsets.only( left: 4.0),
                            width: width*8/10,
                            child: Text(
                              (snapshot.data['name'])
                            ),
                        //   ],
                        ),
                        // Column(
                          
                        //   children: <Widget>[
                          new Container(
                            //margin: new EdgeInsets.only(right: 10.0),
                             width: width/10,
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.green,
                            )
                        //   ],
                        ),
                      ],
                    ),
                    onPressed: navigateToProfile,
                    );
                  }
                  return LinearProgressIndicator();
                },
          ),
          
        ],
    
      
    );
  }

  void navigateToProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(
      studentID: studentID,
      name: name,
      classname: classname,
      contactnum: contactnum,
      gender: gender,
      birthday: birthday,
    ), fullscreenDialog: true));
  }
}

