import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

Widget completedRequestCard({
  BuildContext context,
  ImageProvider imgPath,
  String personName,
  String volName,
}) {
  return Padding(
    padding: EdgeInsets.only(top: 1.0, bottom: 5.0, left: 5.0, right: 5.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: imgPath,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imgPath,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Text("عمره لـ",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontFamily: ArabicFonts.Amiri,
                      package: 'google_fonts_arabic')),
              Text(personName,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontWeight: FontWeight.w700,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic')),
              Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
              Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    children: <Widget>[
                      Text(' المتطوع',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w700,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic')),
                      Text(volName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic')),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
