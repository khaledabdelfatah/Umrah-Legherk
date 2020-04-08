import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screens/welcome_screen.dart';

class signinService {
//   final String username;
// final String password;
// final String phonenum;
// final String email;

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future handleCreatingAccount(
      {String email, String password, BuildContext context}) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return user;
  }

  RegisterData({
    String email,
    String phoneNum,
    String name,
    String imgLink,
  }) async {
    try {
      final FirebaseUser user = await _auth.currentUser();
      // print(user.uid);

      CollectionReference usercollection =
          await Firestore.instance.collection('users');
      print('image link is $imgLink');
      return await usercollection.document(user.uid).setData({
        'name': name,
        'email': email,
        'phone_number': phoneNum,
        'profile_img_link': imgLink,
        'number_ofVolunteering': 0,
        'number_ofRequests': 0,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future singin({String email, String password}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();

    if (user == null) {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } else {
      _auth.signOut();
      print(
          "THere might BE USER HERE FIND HIM NOWW,Iwill Kick him out now!!!!!!!");

      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    }
  }
}
