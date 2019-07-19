import 'package:smart_edkit/pages/setup/sign_in.dart';
import 'package:smart_edkit/pages/setup/sign_up.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Edkit'),
      ),
      body:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                    // Hero(
                    // tag: 'hero',
                    // child: CircleAvatar(
                    //     backgroundColor: Colors.transparent,
                    //     radius: 60.0,
                    //     child: ClipOval(
                    //       child: Image.asset(
                    //         '../../assets/images/default.png',
                    //         fit: BoxFit.cover,
                    //         width: 120.0,
                    //         height: 120.0,
                    //       ),
                    //     )
                    //   ),
                    // ),
                    SizedBox(height: 48.0),
                      // userIdLabel,
                      // Text(appState?.firebaseUserAuth?.uid ?? '',
                      //     style: TextStyle(fontWeight: FontWeight.bold)),
                      // SizedBox(height: 12.0),
                      //emailLabel,
                     
                        Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed:navigateToSignIn,
                          padding: EdgeInsets.all(12),
                          color: Theme.of(context).primaryColor,
                          child: Text('SIGN IN', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed:navigateToSignUp,
                          padding: EdgeInsets.all(12),
                          color: Theme.of(context).primaryColor,
                          child: Text('SIGN UP', style: TextStyle(color: Colors.white)),
                        ),
                      )

                      
                    ],
                  ),
                ),
              ),
            ),
         );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
