import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kounslr3/course_selection_page.dart';
import 'package:kounslr3/crud.dart';
import 'package:kounslr3/hs_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.user}) : super(key: key);
  final UserCredential user;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
   String test = FirebaseAuth.instance.currentUser.uid.toString();

  Widget build(BuildContext context) {
     return Scaffold(
         body:
         Center(
             child: GetUserName(test)),

     );
      //Center(child: Text('test'));
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('courses');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['english']} ${data['math']}",style: TextStyle(fontSize: 12),);
        }

        return Text("loading");
      },
    );
  }
}