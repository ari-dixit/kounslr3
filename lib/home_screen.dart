import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kounslr3/crud.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.user}) : super(key: key);
  final UserCredential user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
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
      crudObj.update('courses', 'English', 'Academic English');
    }
    if (value != false) {
      crudObj.update('courses', 'English', 'Honors English');
    }
  }

  void _honorsSocialStudiesChanged(bool value) {
    setState(() {
      honorsSocialStudies = value;
    });
    if (value != true) {
      crudObj.update('courses', 'Social Studies', 'World History 9');
    }
    if (value != false) {
      crudObj.update('courses', 'Social Studies', 'Pre-AP World History');
    }
  }

  void _geometryMathChanged(bool value) {
    setState(() {
      honorsMath = value;
    });
    if (value != true) {
      crudObj.update('courses', 'Math', 'Algebra 1');
    }
    if (value != false) {
      crudObj.update('courses', 'Math', 'Geometry');
    }
  }

  void _biologyScienceChanged(bool value) {
    setState(() {
      honorsScience = value;
    });
    if (value != true) {
      crudObj.update('courses', 'Science', 'Earth Science');
    }
    if (value != false) {
      crudObj.update('courses', 'Science', 'Biology');
    }
  }

  void _bandElectiveChanged(bool value) {
    setState(() {
      elective1 = value;
    });
    if (value != true) {
      crudObj.update('courses', 'Elective 1', 'Spanish');
    }
    if (value != false) {
      crudObj.update('courses', 'Elective 1', 'Symphonic Band');
    }
  }

  void _businessElectiveChanged(bool value) {
    setState(() {
      elective2 = value;
    });
    if (value != true) {
      crudObj.update('courses', 'Elective 2', 'Theater');
    }
    if (value != false) {
      crudObj.update('courses', 'Elective 2', 'Business');
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
                        GetCourseName(uid, 'Social Studies', 'courses'),
                        GetCourseName(uid, 'English', 'courses'),
                        GetCourseName(uid, 'Math', 'courses'),
                        GetCourseName(uid, 'Science', 'courses'),
                        GetCourseName(uid, 'Phys. Ed.', 'courses'),
                        GetCourseName(uid, 'Elective 1', 'courses'),
                        GetCourseName(uid, 'Elective 2', 'courses'),
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
                        GetCourse(uid, 'Social Studies', 'courses'),
                        GetCourse(uid, 'English', 'courses'),
                        GetCourse(uid, 'Math', 'courses'),
                        GetCourse(uid, 'Science', 'courses'),
                        GetCourse(uid, 'Phys. Ed.', 'courses'),
                        GetCourse(uid, 'Elective 1', 'courses'),
                        GetCourse(uid, 'Elective 2', 'courses'),
                      ],
                    )
                )
              ],
            ),
            /*SizedBox(width: 20, height: 10),
            GetCourse(uid, 'Social Studies', 'courses'),
            SizedBox(width: 20, height: 10),
            GetCourse(uid, 'English', 'courses'),
            SizedBox(width: 20, height: 10),
            GetCourse(uid, 'Math', 'courses'),
            SizedBox(width: 20, height: 10),
            GetCourse(uid, 'Science', 'courses'),
            SizedBox(width: 20, height: 10),
            GetCourse(uid, 'Phys. Ed.', 'courses'),
            SizedBox(width: 20, height: 10),
            GetCourse(uid, 'Elective 1', 'courses'),
            SizedBox(width: 20, height: 10),
            GetCourse(uid, 'Elective 2', 'courses'),
            SizedBox(width: 20, height: 15),*/
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
