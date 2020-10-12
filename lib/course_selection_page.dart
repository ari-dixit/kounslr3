import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kounslr3/crud.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final CollectionReference _coursesCollectionRef =
      FirebaseFirestore.instance.collection('courses');

  QuerySnapshot courses;
  crudMethods crudObj = new crudMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //child: new FlatButton(onPressed: crudObj.addData()),
            ));
  }

  void initState() {
    crudObj.read('courses', 'english').then((results) {
      setState(() {
        courses = results;
      });
    });
    super.initState();
  }

  Widget _courseList() {
    if (courses != null) {
      return ListView.builder(
        itemCount: courses.docs.length,
        itemBuilder: (context, i) {
          return new ListTile(
            title: Text(courses.docs[i].data()['test2']),
            subtitle: Text(courses.docs[i].data()['test']),
          );
        },
      );
    } else {
      return Text('loading');
    }
  }
}
