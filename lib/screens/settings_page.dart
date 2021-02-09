import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kounslr3/background_operations/crud.dart';

class settingsPage extends StatefulWidget {
  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    String email = FirebaseAuth.instance.currentUser.email;
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(children: [
          Text("Welcome, " + uid, style: TextStyle(color: Colors.blue, fontSize: 20)),
          GetCourse(uid, 'First Name', 'users'),
          GetCourse(uid, 'Last Name', 'users'),
          Text("" + email, style: TextStyle(color: Colors.blue, fontSize: 20),),
        ]),
      )),
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String email;
  final String userRole;

  User({this.id, this.fullName, this.email, this.userRole});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
    };
  }
}
