import 'package:kounslr3/screens/course_selection_page.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class CourseButton extends StatelessWidget {
  @override
  Widget build(context) {
    return Center(
      child: RaisedButton.icon(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CoursePage()));
        },
        label: Text(
          'Courses',
          style: TextStyle(fontSize: 25),
        ),
        icon: Icon(Icons.assignment),
        color: Colors.lightBlue,
        textColor: Colors.black,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        splashColor: Colors.grey,
      ),
    );
  }
}

class MessageButton extends StatelessWidget {
  @override
  Widget build(context) {
    return Center(
      child: RaisedButton.icon(
        onPressed: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotesScreen()));
        },
        label: Text(
          'Journal',
          style: TextStyle(fontSize: 25),
        ),
        icon: Icon(Icons.book),
        color: Colors.lightBlue,
        textColor: Colors.black,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        splashColor: Colors.grey,
      ),
    );
  }
}

class ActivityButton extends StatelessWidget {
  @override
  Widget build(context) {
    return Center(
      child: RaisedButton.icon(
        onPressed: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoursePage()));
        },
        label: Text(
          'Activities',
          style: TextStyle(fontSize: 25),
        ),
        icon: Icon(Icons.accessibility_new),
        color: Colors.lightBlue,
        textColor: Colors.black,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        splashColor: Colors.grey,
      ),
    );
  }
}
