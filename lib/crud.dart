import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kounslr3/course_selection_page.dart';

class crudMethods{
  bool isLoggedIn(){
    if (FirebaseAuth.instance.currentUser != null){
      return true;
    } else{
      return false;
    }
  }

  Future<void> addData(courseData) async {
    if(isLoggedIn()) {
      FirebaseFirestore.instance.collection('courses').doc(getUID()).update(courseData).catchError((
          e) {
        print(e);
      });
    }else{
      print('please log in');
    }
  }
  
  getData() async{
    return await FirebaseFirestore.instance.collection('courses').get();
  }
}

getUID()async{
  final User user = await FirebaseAuth.instance.currentUser;
  return user.uid.toString();
}

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference courseCollection = FirebaseFirestore.instance.collection('courses');

  Future updateUserData(String english, String math, String science) async {
    return await courseCollection.doc(uid).set({
      'english': english,
      'math': math,
      'science': science,
    });
  }
}