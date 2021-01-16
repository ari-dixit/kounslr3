import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kounslr3/screens/course_selection_page.dart';
import 'package:kounslr3/screens/home_screen.dart';

class crudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  void create(collection) async {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection(collection).doc(uid).set({
        'firstName': 'test',
        'lastName': 'user',
      });
    } catch (e) {
      print(e);
    }
  }

  Future read( collection, course) async {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    return GetCourse(uid, course, collection);
  }


  Future update(collection, String course, String name) async {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      firestore.collection(collection).doc(uid).update({
        '$course': name,
      });
    } catch (e) {
      print(e);
    }
  }

  void delete(collection) async {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      firestore.collection(collection).doc(uid).delete();
    } catch (e) {
      print(e);
    }
  }
}

getUID() async {
  final User user = await FirebaseAuth.instance.currentUser;
  return user.uid.toString();
}

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference courseCollection =
      FirebaseFirestore.instance.collection('courses');

  Future updateUserData(String english, String math, String science, String gym,
      String history) async {
    return await courseCollection.doc(uid).set({
      'English': english,
      'Math': math,
      'Science': science,
      'Elective 1': 'test1',
      'Elective 2': 'test2',
      'Phys. Ed.': gym,
      'Social Studies': history,
    });
  }
}

class GetCourse extends StatelessWidget {
  final String documentId;
  final String course;
  final String collection;

  GetCourse(this.documentId, this.course, this.collection);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(collection);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text(
            "${data[course]}",
            style: TextStyle(fontSize: 20), textAlign: TextAlign.right,
          );
        }

        return Text("loading");
      },
    );
  }
}

class GetCourseName extends StatelessWidget {
  final String documentId;
  final String course;
  final String collection;

  GetCourseName(this.documentId, this.course, this.collection);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
    FirebaseFirestore.instance.collection(collection);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text(
            "$course:",
            style: TextStyle(fontSize: 20),
          );
        }

        return Text("loading");
      },
    );
  }
}
