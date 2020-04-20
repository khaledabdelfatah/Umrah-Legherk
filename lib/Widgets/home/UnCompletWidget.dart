import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

unCompletedWidget({BuildContext context}) {
  Alert(
        content: Column(
            children: <Widget>[
              Image.asset('assets/img/co.gif'),
            ],
          ),
          context: context,
          title: 'ما زلنا نعمل علي هذا القسم ',
          desc: 'عفوا لم يكتمل هذا القسم, سنحاول اتمامه في اقرب وقت',
      
          style: AlertStyle(
            isCloseButton: false,
              backgroundColor: Colors.black,
              animationType: AnimationType.grow,
              titleStyle: TextStyle(
                color: Colors.orange,
                  fontWeight: FontWeight.w900,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
              ),
              descStyle: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w400,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',)),
            buttons: [DialogButton(
              gradient: LinearGradient(colors: [Colors.orange,Colors.white,Colors.black]),
              child: Text("حسنا",style: TextStyle(
                        fontFamily: ArabicFonts.Changa,
            package: 'google_fonts_arabic'  
            ),), onPressed: ()=>Navigator.pop(context),)]
            )
      .show();
}
