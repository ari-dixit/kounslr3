import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kounslr3/screens/activities_screen.dart';
import 'package:kounslr3/screens/course_selection_page.dart';
import 'package:kounslr3/background_operations/crud.dart';
import 'package:kounslr3/screens/notes_page.dart';

import 'settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.user}) : super(key: key);
  final UserCredential user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new TickerMode(
              enabled: index == 0,
              child: new MaterialApp(home: new CoursePage()),
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child: new MaterialApp(home: new activitiesScreen()),
            ),
          ),
          new Offstage(
            offstage: index != 2,
            child: new TickerMode(
              enabled: index == 2,
              child: new MaterialApp(home: new NotesScreen()),
            ),
          ),
          new Offstage(
            offstage: index != 3,
            child: new TickerMode(
              enabled: index == 3,
              child: new MaterialApp(home: new NotesScreen()),
            ),
          ),
          new Offstage(
            offstage: index != 4,
            child: new TickerMode(
              enabled: index == 4,
              child: new MaterialApp(home: new settingsPage()),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: index,
          backgroundColor: Colors.blue,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
            icon: new Icon(Icons.menu_book_outlined),
            label: "Courses",
                backgroundColor: Colors.blue,
          ),
            new BottomNavigationBarItem(
            icon: new Icon(Icons.emoji_people_outlined),
            label: "Activities",

            ),
            new BottomNavigationBarItem(
            icon: new Icon(Icons.add_box_outlined),
            label: "Journal",
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.add_alert_outlined),
              label: "Profile",
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle_outlined),
              label: "Profile",
            ),
          ],
    ),
    );
  }
}
