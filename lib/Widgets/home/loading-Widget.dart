import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

Widget loadingWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
      ),
      Text(
        "جار التحميل ,, برجاء الانتظار ",
        style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.w700,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
      ),
      CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
      ),
    ],
  );
}
