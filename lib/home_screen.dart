import 'package:flutter/material.dart';
import 'package:kounslr3/hs_buttons.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Kounslr!',
          style: TextStyle(fontSize: 25),),
      ),
      body: Padding(
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
      ),
    );
  }
}