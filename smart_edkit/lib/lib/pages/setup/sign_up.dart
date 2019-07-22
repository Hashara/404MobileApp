import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_edkit/pages/setup/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 48.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
               onSaved: (input) => _email = input,
               validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ), // icon is 48px widget.
                ), // icon is 48px widget.
                hintText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
             SizedBox(height: 20.0),
            TextFormField(
              autofocus: false,
              obscureText: true,
               onSaved: (input) => _password = input,
              validator: (input) {
                  if(input.length < 6){
                    return 'Longer password please';
                  }
                },
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ), // icon is 48px widget.
                ), // icon is 48px widget.
                hintText: 'Password',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed:signUp,
                padding: EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
                child: Text('SIGN UP', style: TextStyle(color: Colors.white)),
              ),
            ),
            
          ],
        )
      ),
    );
  }

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
