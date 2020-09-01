import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kounslr3/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kounslr3/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}