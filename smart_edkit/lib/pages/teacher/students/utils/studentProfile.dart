import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sedkit/pages/setup/toBeImplemented.dart';


class StudentProfile extends StatefulWidget {

  const StudentProfile({Key key, this.schoolid,this.studentid,this.address,this.birthday,this.contactnumber,this.gClass,this.gender,this.name,this.parentName,this.parentOccupation,this.registrationDate,this.workplaceAddress}) : super(key: key);
  final String schoolid;
  final String studentid;
  final String address;
  final DateTime birthday;
  final String contactnumber;
  final String gender;
  final String name;
  final String parentName;
  final String parentOccupation;
  final DateTime registrationDate;
  final String workplaceAddress;
  final String gClass;
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {

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
  String workplaceAddress;
  String _imageUrl;
  String gClass;

 Color gradientStart = Color(0XFFA2A2A6); 
    // Color gradientEnd =  Color(0XFF0C0C42); 
    Color gradientEnd =  Color(0XFFFFFFFF); 

  @override
  void initState() {
      super.initState();
      schoolid = widget.schoolid;
      studentid=widget.studentid;
      address=widget.address;
      birthday=widget.birthday;
      contactnumber = widget.contactnumber;
      gender=widget.gender;
      name=widget.name;
      parentName=widget.parentName;
      parentOccupation=widget.parentOccupation;
      registrationDate=widget.registrationDate;
      workplaceAddress=widget.workplaceAddress;
      gClass=widget.gClass;
      print(registrationDate);

      var ref = FirebaseStorage.instance.ref().child('school/$schoolid/student/$studentid.jpg');
      ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //final String _imageUrl ='https://firebasestorage.googleapis.com/v0/b/wieproject-7703d.appspot.com/o/students%2Fdefault.png?alt=media&token=57fcc98b-83c7-45ef-9e6d-d1e01d265d00';
    return new Stack(children: <Widget>[
      new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0,1.0],
                tileMode: TileMode.mirror
            ),
          ),
      ),
      Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      backgroundColor: Colors.transparent,
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                     FlatButton(
                      onPressed: navigateTo,
                      child:Container(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.grade,
                              color: Theme.of(context).primaryColor,
                            ) ,
                            Text('Grades',
                            style: TextStyle(color: Theme.of(context).primaryColor
                            ))
                          ],
                        ),
                      )
                      
                    ),
                    
                  ],
                ),
              
               // CircleAvatar(radius:width<height? width/5:height/5,backgroundImage: NetworkImage(_imageUrl),),
               CircleAvatar(radius:width<height? width/5:height/5,backgroundColor: Colors.transparent,backgroundImage: _imageUrl == null ? AssetImage('assets/images/default.png', ):NetworkImage(_imageUrl)),
               Column(
                  children: <Widget>[
                     FlatButton(
                      onPressed: navigateTo,
                      child:Container(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Theme.of(context).primaryColor,
                            ) ,
                            Text('Attendance',
                            style: TextStyle(color: Theme.of(context).primaryColor
                            ))
                          ],
                        ),
                      )
                      
                    ),
                    
                  ],
                ),
                
              ],
            ),
         Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      height: 36,
                    )),
              ),
              Text('Student Details',
              style: TextStyle(fontSize: 18.0,color: Theme.of(context).primaryColor)),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      height: 36,
                    )),
              ),
            ]),
          Container(
            
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top: 20.0),
            child:Text('Name : $name',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)
            ), 
          ),
          
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('Admission number : $studentid',
            style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)
             // style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
              ),
          ),
           Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('class :$gClass',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child: Text('gender : $gender',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('birthday : ${birthday.year.toString()}/${birthday.month.toString()}/${birthday.day.toString()}',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
           Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('registration date : ${registrationDate.year.toString()}/${registrationDate.month.toString()}/${registrationDate.day.toString()}',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('Home address : $address',
            style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)
             // style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
              ),
          ),
           Row(children: <Widget>[
           Container(
            alignment: Alignment.centerLeft,
             width: width*8/10,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child: Text('Emegency contact number : $contactnumber',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
          Container(
            width: width/10,
            child: FlatButton(
              onPressed:_launchCaller,
              //onPressed: ()=>{},
              child: Icon(
                Icons.call,
                color:Colors.green,
                
              ),
            ),
          )
         
         ],),
        
         Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      height: 36,
                    )),
              ),
              Text('Parent Details',
              style: TextStyle(fontSize: 18.0,color: Theme.of(context).primaryColor)),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      height: 36,
                    )),
              ),
            ]),
           Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('Parent name : $parentName',
            style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)
             // style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
              ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('Occupation : $parentOccupation',
            style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)
             // style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
              ),
          ),

         Row(children: <Widget>[
           Container(
            alignment: Alignment.centerLeft,
             width: width*8/20,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child: Text('parent\'s number : $contactnumber',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
          Container(
            width: width/10,
            child: FlatButton(
              onPressed:_launchCaller,
              // onPressed: ()=>{},
              child: Icon(
                Icons.call,
                color:Colors.green,
                
              ),
            ),
          )
         
         ],),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('Work place address : $workplaceAddress',
            style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)
             // style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
              ),
          ),
        ],
        ),
      
      ),
      ),
    ],
    
    );
  }

   _launchCaller() async {
    var url = "tel:$contactnumber";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
  }

  void navigateTo(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => TobeImplemented(), fullscreenDialog: true));
   // Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(user: userid), fullscreenDialog: true));
  }
  
}