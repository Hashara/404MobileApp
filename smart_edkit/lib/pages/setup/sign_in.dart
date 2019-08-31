import 'package:firebase_auth/firebase_auth.dart';
import 'package:sedkit/pages/setup/getSchool.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     appBar: new AppBar(),
      body: Center(
        child:loginBody(),
     
       )
      
     
    );
  }

  loginBody() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[loginHeader(), loginFields()],
        ),
      );

  loginHeader() => Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        
        Container(
        width: 200.0,
        height: 170.0,
        decoration: BoxDecoration(
          image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/logo.png')
              ),
          // borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.transparent,
        )),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "Welcome to Smart Edkit",
          style: TextStyle(fontWeight: FontWeight.w700, color:  Color(0XFF0C0C42)),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "Sign in to continue",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  loginFields() => Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextFormField(
                maxLines: 1,
                onSaved: (input) => _email = input,
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextFormField(
                maxLines: 1,
                onSaved: (input) => _password = input,
                validator: (input) {
                    if(input.length < 6){
                      return 'Longer password please';
                    }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0XFF0C0C42),
                 onPressed:signIn,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            
          ],
        ),
      );
  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        //  String currentuser = FirebaseAuth.getInstance().getCurrentUser().getUid();
       // Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomePage(user: user)));
        Navigator.push(context, MaterialPageRoute(builder: (context) => School(userid: user.uid)));
      }catch(e){
        print(e.message);
      }
    }
  }
}