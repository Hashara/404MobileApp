import 'package:flutter/material.dart';

class TobeImplemented extends StatefulWidget {
  @override
  _TobeImplementedState createState() => _TobeImplementedState();
}

class _TobeImplementedState extends State<TobeImplemented> {
   Color gradientStart = Color(0XFFA2A2A6); 
    // Color gradientEnd =  Color(0XFF0C0C42); 
    Color gradientEnd =  Color(0XFFFFFFFF); 
    

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    
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
        title: Text("To be Implemented"),
      ),
      backgroundColor: Colors.transparent,
      body: new SingleChildScrollView(

        child:Column(

          children: <Widget>[
            SizedBox(height: 40,),
              Center(
              child:  Text(
              "To be Implemented...",
              style: TextStyle(fontSize: 30.0,color:Theme.of(context).primaryColor,)
              ),
            ),
            SizedBox(height: 40,),
            Icon(
              Icons.settings,
              // color: Colors.white,
              size: 200,
            ),
            SizedBox(height: 150,),
            
            Row(children: <Widget>[
              SizedBox(
                width: 11*width/16 ,
              ),
               Container(
                width: width/4,
                height: width/5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/logo.png')
                      ),
                  // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.transparent,
                )),
            ],),
            
          
           

          ],
        )
        ),
      )
    ]
    );
  }

}