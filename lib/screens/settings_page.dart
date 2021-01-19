import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kounslr3/screens/sign_up_screen.dart';

import 'course_selection_page.dart';
import '../background_operations/crud.dart';
import 'home_screen.dart';
import '../background_operations/login_screen_constants.dart';


class settingsPage extends StatefulWidget {
  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    String email = FirebaseAuth.instance.currentUser.email;
    String name = FirebaseAuth.instance.currentUser.displayName;
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text("Welcome, " + uid, style: TextStyle(color: Colors.blue, fontSize: 20)),
              Text(""+email, style: TextStyle(color: Colors.blue, fontSize: 20)),
              Text("Account Type: "),
            ]
          ),
        )
      ),
    );
  }
}
