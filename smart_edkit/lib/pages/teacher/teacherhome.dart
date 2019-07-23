import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_edkit/pages/teacher/notes.dart';
import 'package:smart_edkit/pages/teacher/admin.dart';
import 'package:smart_edkit/pages/teacher/attendance.dart';
import 'package:smart_edkit/pages/teacher/map.dart';
import 'package:smart_edkit/pages/teacher/students.dart';
import 'package:smart_edkit/pages/teacher/timetable.dart';
//import 'package:smart_edkit/pages/teacher/calender/clean_calander.dart';
class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  
   FirebaseUser user;
  @override
  void initState() {
      super.initState();
      user = widget.user;
    }
  @override
   Widget build(BuildContext context) {
    var adminImage = new AssetImage('assets/images/admin.png');
    var admin = new Image(image: adminImage, height: 140.0, width: 140.0);
    var attendanceImage = new AssetImage("assets/images/attendance.png");
    var attendance = new Image(image: attendanceImage, height: 150.0, width: 150.0);
    var mapImage = new AssetImage("assets/images/map.png");
    var map = new Image(image: mapImage, height: 50.0, width: 50.0);
    var notesImage = new AssetImage("assets/images/notes.png");
    var notes = new Image(image: notesImage, height: 50.0, width: 50.0);
    var studentsImage = new AssetImage("assets/images/students.png");
    var students = new Image(image: studentsImage, height: 50.0, width: 50.0);
    var timetableImage = new AssetImage("assets/images/timetable.png");
    var timetable = new Image(image: timetableImage, height: 50.0, width: 50.0);
    return  new Scaffold(
      appBar: AppBar(
        title: Text('Home ${user.uid}'),
      ),
      body:Column(
        
        children: <Widget>[
          SizedBox(height: 40.0),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
            
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height: admin.height,
                    width: admin.width,
                     child: new FlatButton(

                      onPressed: navigateToAttendance,
                      
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: attendance,
                      ),
                     ),
                  ),
                  Text('My Attendance',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                    )
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height: admin.height,
                    width: admin.width,
                     child: new FlatButton(
                      onPressed: navigateToTimetable,
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        
                        child: timetable,
                      ),
                     ),
                  ),
                  Text('Time Table',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                    )
                  )
                ],
              )
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height: admin.height,
                    width: admin.width,
                     child: new FlatButton(

                      onPressed: navigateToNotes,
                    
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: notes,
                      ),
                     ),
                  ),
                  Text('Notes',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                    )
                  )
                ],
              ),
             Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height: admin.height,
                    width: admin.width,
                     child: new FlatButton(

                      onPressed: navigateToStudents,
                    
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: students,
                      ),
                     ),
                  ),
                  Text('My Students',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                    )
                  )
                ],
              ),
            ],
          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height: admin.height,
                    width: admin.width,
                     child: new FlatButton(

                      onPressed: navigateToAdmin,
                    
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: admin,
                      ),
                     ),
                  ),
                  Text('Admin',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                    )
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height: admin.height,
                    width: admin.width,
                     child: new FlatButton(

                      onPressed:navigateToMap,
                    
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: map,
                      ),
                     ),
                  ),
                  Text('Map',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                    )
                  )
                ],
              ),
            ],
          ),
        ],
      ),

    );
  }

  void navigateToNotes(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NotesPage(user: user.uid), fullscreenDialog: true));
  }
  void navigateToTimetable(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => TimeTablePage(user: user), fullscreenDialog: true));
  }
  void navigateToAdmin(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage(user: user), fullscreenDialog: true));
  }
  void navigateToStudents(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsPage(user: user), fullscreenDialog: true));
  }
  void navigateToMap(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(user: user), fullscreenDialog: true));
  }
  void navigateToAttendance(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AttendancePage(user:user), fullscreenDialog: true));
  }
}