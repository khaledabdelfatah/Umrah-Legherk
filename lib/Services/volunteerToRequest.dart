import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:umruh_lgherak/Screens/home_screen.dart';

updateInfo({String volunteerPerson, String id, BuildContext context}) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseUser currentUser = await _auth.currentUser();
  var requestPublisherName;
  CollectionReference requestCollections;
  try {
    requestCollections = Firestore.instance.collection('requests');
    await requestCollections.document(id).get().then((doc) {
      requestPublisherName = doc['puplisher'];
    });
  } catch (e) {
    print('HERE IS ERROR $e');
  }

  if (requestPublisherName == volunteerPerson) {
    Navigator.pop(context);
    return Alert(
        closeFunction: () {
          Navigator.pop(context);
        },
        context: context,
        title: 'عفوا لا يمكنك التطوع لطلب انت قمت بتقديمه',
        type: AlertType.error,
        desc: 'من اجل اتمام الطلب يجب ان يتطوع اي شخص غير صاحب الطلب',
        style: AlertStyle(
          descStyle: TextStyle(
              fontWeight: FontWeight.w700,
              package: 'google_fonts_arabic',
              fontFamily: ArabicFonts.Tajawal),
          titleStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.red,
              package: 'google_fonts_arabic',
              fontFamily: ArabicFonts.Cairo),
        ),
        buttons: [
          DialogButton(
            color: Colors.grey,
            child: Text(
              "العوده",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: ArabicFonts.Tajawal,
                fontWeight: FontWeight.w700,
                package: 'google_fonts_arabic',
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          DialogButton(
            color: Colors.orange,
            child: Text(
              "الصفحه الرئيسيه",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: ArabicFonts.Tajawal,
                fontWeight: FontWeight.w900,
                package: 'google_fonts_arabic',
              ),
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, Home_Screen.id),
          )
        ]).show();
  } else {
    // print(user.uid);
    try {
      await requestCollections.document(id).updateData({
        'isCompleted': true,
        'volunteerPerson_name': volunteerPerson,
      });
    } catch (e) {
      print(e.toString());
    }
    try {
      int volNumbers;
      CollectionReference usercollection =
          Firestore.instance.collection('users');
      await usercollection.document(currentUser.uid).get().then((doc) {
        volNumbers = doc['number_ofVolunteering'];
      });
      await usercollection.document(currentUser.uid).updateData({
        'number_ofVolunteering': volNumbers + 1,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
