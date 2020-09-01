import 'package:flutter/material.dart';
import 'package:kounslr3/hs_buttons.dart';
import 'dart:io';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);

class CoursePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('courses').snapshots(),
      builder: (context, snapshot){
          if(!snapshot.hasData) return Text('No Data Found.');
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FreshmanCourseButton(),
              ),
            ]
          );

      }
      ),
    );
  }
}

class FreshmanCourseSelector extends StatefulWidget {
  @override
  _FreshmanCourseSelectorState createState() => _FreshmanCourseSelectorState();
}

class _FreshmanCourseSelectorState extends State<FreshmanCourseSelector> {
  var english = ['English 9 H', 'English 9 A'];

  String _currentItemSelectedForEnglish;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Selection',
          style: TextStyle(fontSize: 25),),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text('Select your courses below:',
                      style: TextStyle(fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: DropdownButton<String>(
                      items: english.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem ,
                          child: Text(dropDownStringItem,
                            style: TextStyle(fontSize: 20),),
                        );
                      }).toList(),
                      hint: new Text('English Course'),
                      onChanged: (val) {
                        setState(() {
                          _currentItemSelectedForEnglish = val;
                          FirebaseFirestore.instance.collection('courses').doc()
                              .set({'English': _currentItemSelectedForEnglish});
                        });
                      },
                      value: _currentItemSelectedForEnglish,
                    ),
                  ),
                ]
            ),
          )
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}