import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  final String studentID;
  final String name;
  final String classname;
  final String contactnum;
  final String gender;
  final DateTime birthday;
  ProfilePage({
    this.classname,this.contactnum,this.name,this.studentID,this.birthday,this.gender
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String studentID;
  String name;
  String classname;
  String contactnum;
   String gender;
  DateTime  birthday;
  String _imageUrl;
  @override
  void initState() {
      super.initState();
      studentID = widget.studentID;
      name=widget.name;
      classname=widget.classname;
      contactnum=widget.contactnum;
      gender=widget.gender;
      birthday=widget.birthday;
    }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                     FlatButton(
                      onPressed: ()=>{},
                      child:Icon(
                        Icons.grade,
                        color: Colors.blue,
                      ) ,
                    ),
                    Text('Grades')
                  ],
                ),
                
               Column(
                  children: <Widget>[
                     FlatButton(
                      onPressed: ()=>{},
                      child:Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ) ,
                    ),
                    Text('Attendance')
                  ],
                ),
                
              ],
            ),
         
          Container(
            
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0,top: 20.0),
            child:Text('Name:$name',
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
            ), 
          ),
          
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0),
            child:Text('Admission number: $studentID',
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
          ),
           Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0),
            child:Text('class:$classname',
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0),
            child: Text('gender:$gender',
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0),
            child:Text('birthday: ${birthday.year.toString()}/${birthday.month.toString()}/${birthday.day.toString()}',
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
          ),
         Row(children: <Widget>[
           Container(
            alignment: Alignment.centerLeft,
             width: width*8/10,
            margin: new EdgeInsets.only( left: 10.0),
            child: Text('parent\'s number: $contactnum',
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
          ),
          Container(
            width: width/10,
            child: FlatButton(
              onPressed:_launchCaller,
              child: Icon(
                Icons.call,
                color:Colors.green,
              ),
            ),
          )
         
         ],)
          
        ],
        ),
      ),
    );
  }

  _launchCaller() async {
    var url = "tel:$contactnum";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
  }


}
