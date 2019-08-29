import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      
       var ref = FirebaseStorage.instance.ref().child('students/$studentID.png');
      ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));

    }
   
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //final String _imageUrl ='https://firebasestorage.googleapis.com/v0/b/wieproject-7703d.appspot.com/o/students%2Fdefault.png?alt=media&token=57fcc98b-83c7-45ef-9e6d-d1e01d265d00';
    return new Stack(children: <Widget>[
      new Container(color: Colors.lightBlue[50],),
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
                      onPressed: ()=>{},
                      child:Container(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.grade,
                              color: Colors.blue,
                            ) ,
                            Text('Grades')
                          ],
                        ),
                      )
                      
                    ),
                    
                  ],
                ),
              
               // CircleAvatar(radius:width<height? width/5:height/5,backgroundImage: NetworkImage(_imageUrl),),
               CircleAvatar(radius:width<height? width/5:height/5,backgroundImage: _imageUrl == null ? Image.asset('images/default.png', height: 110.0,):NetworkImage(_imageUrl)),
               Column(
                  children: <Widget>[
                     FlatButton(
                      onPressed: ()=>{},
                      child:Container(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.blue,
                            ) ,
                            Text('Attendance')
                          ],
                        ),
                      )
                      
                    ),
                    
                  ],
                ),
                
              ],
            ),
         
          Container(
            
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0,top: 20.0),
            child:Text('Name:$name',
              style: TextStyle(fontSize: 16.0,)
            ), 
          ),
          
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0,top:5),
            child:Text('Admission number: $studentID',
            style: TextStyle(fontSize: 16.0,)
             // style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
              ),
          ),
           Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0,top:5),
            child:Text('class:$classname',
              style: TextStyle(fontSize: 16.0,)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0,top:5),
            child: Text('gender:$gender',
              style: TextStyle(fontSize: 16.0,)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 10.0,top:5),
            child:Text('birthday: ${birthday.year.toString()}/${birthday.month.toString()}/${birthday.day.toString()}',
              style: TextStyle(fontSize: 16.0,)),
          ),
         Row(children: <Widget>[
           Container(
            alignment: Alignment.centerLeft,
             width: width*8/10,
            margin: new EdgeInsets.only( left: 10.0,top:5),
            child: Text('parent\'s number: $contactnum',
              style: TextStyle(fontSize: 16.0,)),
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
    ),
    ]
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
