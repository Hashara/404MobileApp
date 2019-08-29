import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sedkit/pages/teacher/admin.dart';
import 'package:sedkit/pages/teacher/attendance.dart';
import 'package:sedkit/pages/teacher/map.dart';
import 'package:sedkit/pages/teacher/students.dart';
import 'package:sedkit/pages/teacher/timetable.dart';
import 'package:sedkit/pages/teacher/notes/screens/note_list.dart';
import 'package:sedkit/pages/teacher/profiledetails/profile.dart';
import 'package:sedkit/pages/teacher/students/databaseConnections/class.dart';


class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key key, this.userid,this.schoolid,this.uid}) : super(key: key);
  final String userid;
  final String schoolid;
  final String uid;
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  
   String userid;
   String schoolid;
   String uid;

  @override
  void initState() {
      super.initState();
      userid = widget.userid;
      schoolid=widget.schoolid;
      uid=widget.uid;
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
    var logoImage = new AssetImage('assets/images/logo.png');
    var logo = new Image(image: logoImage, height: 140.0, width: 140.0);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color gradientStart = Color(0XFFA2A2A6); 
    Color gradientEnd =  Color(0XFF0C0C42); 
    return  new Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        //: Color(0XFFA2A2A6),//gray
         backgroundColor: Color(0XFF0C0C42),//dark blue
        
        actions: <Widget>[
        IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
               //profile detail view 
                 navigateToProfile();
              },
            ),
        ]

      ),
      //backgroundColor: Color(0xFF0000),//black
      //backgroundColor: Color(0XFFA2A2A6),//gray
      //backgroundColor: Color(0XFF0C0C42),//darkblue
     // backgroundColor: Color(0XFF23237D),//blue
      //backgroundColor: Color(0XFF4A66AC),//blue


      body:  new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0,1.0],
                tileMode: TileMode.mirror
            ),
          ),
          child: Center(
            child: Column(children: <Widget>[
          SizedBox(height:20,),
          //Image.asset('assets/images/logo.png'),
          Container(
        width: 190.0,
        height: 170.0,
        decoration: BoxDecoration(
          image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/logo.png')
              ),
          // borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.transparent,
        )),

          Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 50.0),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment:CrossAxisAlignment.stretch ,
            children: <Widget>[
            
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment:CrossAxisAlignment.stretch ,
                 children: <Widget>[
                  Container(
                    height: (width/20)*6.5,
                    width: (width/20)*6.5,
                     child: new FlatButton(
                      color: Color(0xFF46C25D),
                      splashColor: Colors.transparent,  
                      highlightColor: Colors.transparent,
                      onPressed: navigateToAttendance,
                      
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: attendance,
                      ),
                     ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
           
                    height: (width/20)*6.5,
                    width: (width/20)*6.5,
                     child: new FlatButton(
                      onPressed: navigateToTimetable,
                      color: Color(0xFFB83DBA),
                       splashColor: Colors.transparent,  
                       highlightColor: Colors.transparent,
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        
                        child: timetable,
                      ),
                     ),
                  ),
                ],
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height:(width/20)*6.5,
                    width: (width/20)*6.5,
                     child: new FlatButton(
                       color: Color(0xFFFFCA18),
                       splashColor: Colors.transparent,  
                      highlightColor: Colors.transparent,
                      onPressed: navigateToNotes,
                    
                      child: new Container(
                        constraints: new BoxConstraints.expand(),
                        //color: Colors.green,
                        child: notes,
                      ),
                     ),
                  ),
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
                    height: (width/20)*6.5,
                    width:(width/20)*6.5,
                     child: new FlatButton(

                      onPressed: navigateToStudents,
                      color: Color(0xFF01828E),
                      splashColor: Colors.transparent,  
                      highlightColor: Colors.transparent,
                    
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: students,
                      ),
                     ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height: (width/20)*6.5,
                    width: (width/20)*6.5,
                     child: new FlatButton(
                      color: Color(0xFF3F48CC),
                      onPressed: navigateToAdmin,
                      splashColor: Colors.transparent,  
                      highlightColor: Colors.transparent,
                    
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: admin,
                      ),
                     ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    height: (width/20)*6.5,
                    width: (width/20)*6.5,
                     child: new FlatButton(
                      color: Color(0xFFEC1C24),
                      onPressed:navigateToMap,
                      splashColor: Colors.transparent,  
                      highlightColor: Colors.transparent,
                    
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: map,
                      ),
                     ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      ],
      ),
      ),
        ),
      );
  }

  void navigateToNotes(){
    //print(schoolid);
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteList(), fullscreenDialog: true));
  }
  //  void navigateToNotes(){
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectListPage(user: user.uid), fullscreenDialog: true));
  // }
  void navigateToTimetable(){
    // Navigator.push(context, MaterialPageRoute(builder: (context) => TimeTablePage(user: userid), fullscreenDialog: true));
  }
  void navigateToAdmin(){
    //Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage(user: userid), fullscreenDialog: true));
  }
  void navigateToStudents(){
   //Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsPage(userid: userid,schoolid: schoolid,), fullscreenDialog: true));
   Navigator.push(context, MaterialPageRoute(builder: (context) => ClassGetter(userid: userid,schoolid: schoolid,), fullscreenDialog: true));

  }
  void navigateToMap(){
   // Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(user: userid), fullscreenDialog: true));
  }
  void navigateToAttendance(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AttendancePage(userid:userid,schoolid: schoolid), fullscreenDialog: true));
  }

  void navigateToProfile(){
    print(uid);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileTeacherPage(userid: userid,schoolid: schoolid,), fullscreenDialog: true));
  }
}