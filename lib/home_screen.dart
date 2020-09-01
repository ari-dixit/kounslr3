import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kounslr3/course_selection_page.dart';
import 'package:kounslr3/hs_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kounslr3/notes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.user}) : super(key: key);
  final UserCredential user;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final tabs = [
    Center(child: Text('Home')),
    CoursePage(),
    NotesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_file),
            label: 'Notes',
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      )
      /*body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: CourseButton(),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: MessageButton(),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ActivityButton(),
              ),
            ]
        ),
      ),*/
    );
  }
}