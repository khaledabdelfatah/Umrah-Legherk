import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:umruh_lgherak/Screens/login_screen.dart';
import 'package:umruh_lgherak/Screens/regestrationScreen.dart';

// Widget For Showing Glow around the logo
AvatarGlow log_avatarGlow() {
  return AvatarGlow(
    startDelay: Duration(milliseconds: 100),
    glowColor: Colors.orange,
    endRadius: 90.0,
    duration: Duration(milliseconds: 1000),
    repeat: true,
    showTwoGlows: true,
    repeatPauseDuration: Duration(milliseconds: 100),
    child: Material(
      elevation: 8.0,
      shape: CircleBorder(),
      child: CircleAvatar(
        backgroundColor: Color.fromRGBO(30, 25, 25, 1.00),
        child: Hero(
          tag: "mylogotag",
          child: Image.asset(
            'assets/img/appIcon.png',
            fit: BoxFit.fill,
            // height: 60,
          ),
        ),
        radius: 60.0,
      ),
    ),
    shape: BoxShape.circle,
    animate: true,
    curve: Curves.fastOutSlowIn,
  );
}

// This Widget is responsible for makeing animated Text on the Screen
// the Text is [عمره لغيرك]

Widget title(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TyperAnimatedTextKit(
          onTap: () {
            print(" TITLE IS Pressed");
          },
          text: ['عمره لغيرك'],
          textStyle: TextStyle(
              color: Colors.orange[50],
              letterSpacing: 1.0,
              fontFamily: ArabicFonts.Rakkas,
              package: 'google_fonts_arabic',
              fontSize: MediaQuery.of(context).size.width / 7),
          speed: Duration(seconds: 1),
          displayFullTextOnTap: true,
          textAlign: TextAlign.start,
          alignment: AlignmentDirectional.topStart),
    ),
  );
}

// Button to navigate to singIn Screen
// The Text is [سجل الدخول]

Widget submitButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, LoginScreen.id);
      print('GOING TO SINGIN PAGE');
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(247, 237, 237, 1.0),
                offset: Offset(2, 4),
                blurRadius: 8,
                spreadRadius: 2)
          ],
          color: Colors.white),
      child: Text(
        'سجل الدخول',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
      ),
    ),
  );
}

// Button to navigate to  regestration Screen
// The Text is[انشاء حساب جديد]
Widget signUpButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, Regestration_Screen.id);
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Text(
        'انشاء حساب جديد',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
      ),
    ),
  );
}

// Lable Displayed in the botto of the Screen
//[واتموا الحج والعمرة لله]
Widget label({double size}) {
  return Container(
      // margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
        child: Text(
          '\" وَأَتِمُّوا الْحَجَّ وَالْعُمْرَةَ لِلَّهِ\"',
          style: TextStyle(
            fontSize: size,
            color: Colors.grey[100],
            fontFamily: ArabicFonts.Aref_Ruqaa,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
    ],
  ));
}
