import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_edkit/pages/teacher/teacherhome.dart';
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
     // appBar: new AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // TextFormField(
            //   validator: (input) {
            //     if(input.isEmpty){
            //       return 'Provide an email';
            //     }
            //   },
            //   decoration: InputDecoration(
            //     labelText: 'Email'
            //   ),
            //   onSaved: (input) => _email = input,
            // ),
            // TextFormField(
            //   validator: (input) {
            //     if(input.length < 6){
            //       return 'Longer password please';
            //     }
            //   },
              
            //   decoration: InputDecoration(
            //     labelText: 'Password'
            //   ),
            //   onSaved: (input) => _password = input,
            //   obscureText: true,
            // ),
            SizedBox(height: 250.0),
            
             SizedBox(width: 100.0),
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
                onPressed:signIn,
                padding: EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
                child: Text('SIGN IN', style: TextStyle(color: Colors.white)),
              ),
            ),
            
          ],
        )
      ),
    );
  }

  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        //  String currentuser = FirebaseAuth.getInstance().getCurrentUser().getUid();
        Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomePage(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }
}