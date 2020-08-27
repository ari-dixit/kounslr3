import 'package:flutter/material.dart';

import 'login_page.dart';
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My firebase app'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignIn,
            child: Text('Sign in'),
          ),
          RaisedButton(
            onPressed: (){},
            child: Text('Sign up'),
          )
        ],
      )
    );
  }

  void navigateToSignIn(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){

  }
}
