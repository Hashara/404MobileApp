import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sedkit/pages/teacher/students/utils/studentProfile.dart';

class StudentDetailsGetter extends StatefulWidget {
  const StudentDetailsGetter({Key key, this.schoolid,this.studentid,this.gClass}) : super(key: key);
  
  final String schoolid;
  final String studentid;
  final String gClass;

  @override
  _StudentDetailsGetterState createState() => _StudentDetailsGetterState();
}

class _StudentDetailsGetterState extends State<StudentDetailsGetter> {

  String schoolid;
  String studentid;
  String address;
  DateTime birthday;
  String contactnumber;
  String gender;
  String name;
  String parentName;
  String parentOccupation;
  DateTime registrationDate;
  String gClass;
  String workplaceAddress;

  @override
  void initState() {
      super.initState();
      schoolid = widget.schoolid;
      studentid=widget.studentid;
      gClass=widget.gClass;
      //print(schoolid);
  }

  @override
  Widget build(BuildContext context) {

    //return Text("data");

    double width = MediaQuery.of(context).size.width;

     return  Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,  
        children: <Widget>[
  
      
     StreamBuilder<DocumentSnapshot>(//working
        stream: Firestore.instance
            .collection('school')
            .document(schoolid)
            .collection('student')
            .document(studentid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
                //print(snapshot.data['address']);

                address=snapshot.data['address'];
                birthday=snapshot.data['birthday'].toDate();
                contactnumber=snapshot.data['contact_number'];
                gender=snapshot.data['gender'];
                name=snapshot.data['name'];
                parentName=snapshot.data['parent_name'];
                parentOccupation=snapshot.data['parent_occupation'];
                registrationDate=snapshot.data['registration date'].toDate();
                // uid=snapshot.data[];
                workplaceAddress=snapshot.data['work_place_address'];
                 return FlatButton(
                    child:Row(
                      
                      children: <Widget>[
                         new Container(
                            alignment: Alignment.centerLeft,
                            margin: new EdgeInsets.only( left: 4.0),
                            width: width*8/10,
                            child: Text(
                              (snapshot.data['name']),
                              style: TextStyle(color: Theme.of(context).primaryColor),
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
                         // return getStudentsWidgets(snapshot.data['students']);
               //print(workplaceAddress);
          }
          return LinearProgressIndicator();
        },
      ),
        ]
    );
   }

   void navigateToProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfile(
      address:address,
      name: name,
      contactnumber:contactnumber,
      gender: gender,
      birthday: birthday,
      parentName: parentName,
      parentOccupation: parentOccupation,
      registrationDate: registrationDate,
      workplaceAddress: workplaceAddress,
      studentid: studentid,
      schoolid: schoolid,
      gClass:gClass,
    ), fullscreenDialog: true));
  }
}