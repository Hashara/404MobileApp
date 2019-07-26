import 'package:firebase_auth/firebase_auth.dart';
import 'package:sedkit/pages/setup/sign_in.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
        FlutterLogo(
          colors: Colors.blue,
          size: 80.0,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "Welcome to Smart Edkit",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.blue),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "Sign up to continue",
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
                keyboardType: TextInputType.emailAddress,
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
                  "SIGN UP",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                 onPressed:signUp,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            
          ],
        ),
      );
  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        // DatabaseReference ref = FirebaseDatabase
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){  
        print(e.message);
      }
    }
  }
}
