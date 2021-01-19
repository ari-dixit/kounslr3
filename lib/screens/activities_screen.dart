import 'package:flutter/cupertino.dart';
import 'package:kounslr3/background_operations/crud.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kounslr3/background_operations/crud.dart';

class  activitiesScreen extends StatelessWidget {
  @override
  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        children: [
      GetCourseName(uid, 'Social Studies', 'courses'),
      GetCourseName(uid, 'English', 'courses'),
      GetCourseName(uid, 'Math', 'courses'),
      GetCourseName(uid, 'Science', 'courses'),
      GetCourseName(uid, 'Phys. Ed.', 'courses'),
      GetCourseName(uid, 'Elective 1', 'courses'),
      GetCourseName(uid, 'Elective 2', 'courses'),
      TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter a search term',
            ),
            onChanged: (text) {
                print("First text field: $text");
              },
      )
      ],
      ),
    ));
  }
}
