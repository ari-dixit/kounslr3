import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kounslr3/background_operations/crud.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  crudMethods crudObj = new crudMethods();
  bool honorsEnglish = false;
  bool honorsSocialStudies = false;
  bool honorsMath = false;
  bool honorsScience = false;
  bool elective1 = false;
  bool elective2 = false;

  void _honorsEnglishChanged(bool value) {
    setState(() {
      honorsEnglish = value;
    });
    if (value != true) {
      crudObj.update('users', 'English', 'Academic English');
    }
    if (value != false) {
      crudObj.update('users', 'English', 'Honors English');
    }
  }

  void _honorsSocialStudiesChanged(bool value) {
    setState(() {
      honorsSocialStudies = value;
    });
    if (value != true) {
      crudObj.update('users', 'Social Studies', 'World History 9');
    }
    if (value != false) {
      crudObj.update('users', 'Social Studies', 'Pre-AP World History');
    }
  }

  void _geometryMathChanged(bool value) {
    setState(() {
      honorsMath = value;
    });
    if (value != true) {
      crudObj.update('users', 'Math', 'Algebra 1');
    }
    if (value != false) {
      crudObj.update('users', 'Math', 'Geometry');
    }
  }

  void _biologyScienceChanged(bool value) {
    setState(() {
      honorsScience = value;
    });
    if (value != true) {
      crudObj.update('users', 'Science', 'Earth Science');
    }
    if (value != false) {
      crudObj.update('users', 'Science', 'Biology');
    }
  }

  void _bandElectiveChanged(bool value) {
    setState(() {
      elective1 = value;
    });
    if (value != true) {
      crudObj.update('users', 'Elective 1', 'Spanish');
    }
    if (value != false) {
      crudObj.update('users', 'Elective 1', 'Symphonic Band');
    }
  }

  void _businessElectiveChanged(bool value) {
    setState(() {
      elective2 = value;
    });
    if (value != true) {
      crudObj.update('users', 'Elective 2', 'Theater');
    }
    if (value != false) {
      crudObj.update('users', 'Elective 2', 'Business');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text(
            'Course Selection',
            style: TextStyle(fontSize: 30),
          )),
      backgroundColor: Color(0xFF61A4F1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(width: 20, height: 30),
            Text('Your Current Schedule:',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    margin:
                    EdgeInsets.fromLTRB(5.0, 10.0, 2.5, 10.0),
                    padding:
                    EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GetCourseName(uid, 'Social Studies', 'users'),
                        GetCourseName(uid, 'English', 'users'),
                        GetCourseName(uid, 'Math', 'users'),
                        GetCourseName(uid, 'Science', 'users'),
                        GetCourseName(uid, 'Phys. Ed.', 'users'),
                        GetCourseName(uid, 'Elective 1', 'users'),
                        GetCourseName(uid, 'Elective 2', 'users'),
                      ],
                    )),
                Container(
                    margin:
                    EdgeInsets.fromLTRB(2.5, 10.0, 5.0, 10.0),
                    padding:
                    EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetCourse(uid, 'Social Studies', 'users'),
                        GetCourse(uid, 'English', 'users'),
                        GetCourse(uid, 'Math', 'users'),
                        GetCourse(uid, 'Science', 'users'),
                        GetCourse(uid, 'Phys. Ed.', 'users'),
                        GetCourse(uid, 'Elective 1', 'users'),
                        GetCourse(uid, 'Elective 2', 'users'),
                      ],
                    )
                )
              ],
            ),
            Text('Edit your schedule below:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            /*new FlatButton(
                onPressed: () {
                  (context as Element).reassemble();
                },
                child: Text('Save')),*/
            CheckboxListTile(
              title: new Text('Honors English'),
              value: honorsEnglish,
              onChanged: (_honorsEnglishChanged),
            ),
            CheckboxListTile(
              title: new Text('Pre-AP World History'),
              value: honorsSocialStudies,
              onChanged: (_honorsSocialStudiesChanged),
            ),
            CheckboxListTile(
              title: new Text('Geometry'),
              value: honorsMath,
              onChanged: (_geometryMathChanged),
            ),
            CheckboxListTile(
              title: new Text('Biology'),
              value: honorsScience,
              onChanged: (_biologyScienceChanged),
            ),
            CheckboxListTile(
              title: new Text('Band'),
              value: elective1,
              onChanged: (_bandElectiveChanged),
            ),
            CheckboxListTile(
              title: new Text('Business'),
              value: elective2,
              onChanged: (_businessElectiveChanged),
            ),
          ],
        ),
      ),
    );
    //Center(child: Text('test'));
  }
}
