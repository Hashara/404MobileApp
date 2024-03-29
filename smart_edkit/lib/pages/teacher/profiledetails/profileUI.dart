import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileUipage extends StatefulWidget {
  final String address;
  final DateTime birthday;
  final String gClass;
  final String contactnumber;
  final String gender;
  final String name;
  final String nic; 
  final String userid;
  final String schoolid;

  const ProfileUipage({Key key, this.userid,this.schoolid,this.address,this.birthday,this.contactnumber,this.gClass,this.gender,this.name,this.nic}) : super(key: key);

  @override
  _ProfileUipageState createState() => _ProfileUipageState();
}

class _ProfileUipageState extends State<ProfileUipage> {
 
  String address;
  DateTime birthday;
  String gClass;
  String contactnumber;
  String gender;
  String name;
  String nic; 
  String userid;
  String schoolid;
   String _imageUrl;

  Color gradientStart = Color(0XFFA2A2A6); //Change start gradient color here
  // Color gradientEnd =  Color(0XFF0C0C42);
  Color gradientEnd =  Color(0XFFFFFFFF);

  @override
  void initState() {
      super.initState();
      address=widget.address;
      birthday=widget.birthday;
      gClass=widget.gClass;
      contactnumber=widget.contactnumber;
      gender=widget.gender;
      name=widget.name;
      nic=widget.nic;
      userid=widget.userid;
      schoolid=widget.schoolid;

      var ref = FirebaseStorage.instance.ref().child('school/$schoolid/teachers/$userid.jpg');
      ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));

     
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //double height = MediaQuery.of(context).size.height;
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
      ),Scaffold(
      
      backgroundColor: Colors.transparent,
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
           CircleAvatar(radius:width<height? width/5:height/5,
          //  backgroundImage:AssetImage('assets/images/teacher.png') ,
            backgroundImage: _imageUrl == null ? AssetImage('assets/images/teacher.png', ):NetworkImage(_imageUrl),
           backgroundColor: Colors.transparent ,
           ),
          //  backgrou
          //  backgroundImage: Image.asset('images/default.png', height: 110.0,)),
          Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      height: 36,
                    )),
              ),
              Text('My Profile',
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
            margin: new EdgeInsets.only( left:20.0,top: 20.0),
            child:Text('Name : $name',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)
            ), 
          ),
          
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('Class : $gClass',
            style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)
             // style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)
              ),
          ),
           Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('Gender : $gender',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child: Text('Address : $address',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child: Text('NIC : $nic',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child:Text('Birthday : ${birthday.year.toString()}/${birthday.month.toString()}/${birthday.day.toString()}',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
          ),
         Row(children: <Widget>[
           Container(
            alignment: Alignment.centerLeft,
             width: width*8/10,
            margin: new EdgeInsets.only( left: 20.0,top:5),
            child: Text('Conatact number : $contactnumber',
              style: TextStyle(fontSize: 16.0,color: Theme.of(context).primaryColor)),
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
    var url = "tel:$contactnumber";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
  }

}