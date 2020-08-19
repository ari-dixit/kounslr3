import 'package:flutter/material.dart';
import 'package:kounslr3/hs_buttons.dart';
import 'dart:io';
import 'dart:convert';

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
      appBar: AppBar(
        title: Text('Course Outline',
          style: TextStyle(fontSize: 25),),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FreshmanCourseButton(),
              ]
          )
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

/*class FreshmanCourseSelector extends StatefulWidget {
  @override
  _FreshmanCourseSelectorState createState() => _FreshmanCourseSelectorState();
}

class _FreshmanCourseSelectorState extends State<FreshmanCourseSelector> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Course Selection',
        style: TextStyle(fontSize: 25),),
    ),
      key: _formKey,
        body: Padding(
        padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            value: _currentSugars ?? '0',
            decoration: textInputDecoration,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              }
          ),
        ],
      ),
    ));
  }
}*/
