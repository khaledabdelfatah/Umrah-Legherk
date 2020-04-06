import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:umruh_lgherak/Screens/regestrationScreen.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/textformfiled.dart';
// import './textformfiled.dart';

Widget welcomeTextRow({double width, double height, bool large, bool medium}) {
  return Container(
    margin: EdgeInsets.only(left: width / 5, top: height / 100),
    child: Row(
      children: <Widget>[
        Text(
          "مرحبا بك مجددا",
          style: TextStyle(
            fontFamily: ArabicFonts.El_Messiri,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
            fontSize: large ? 50 : (medium ? 40 : 30),
          ),
        ),
      ],
    ),
  );
}

Widget signInTextRow({double width, double height, bool large, bool medium}) {
  return Container(
    margin: EdgeInsets.fromLTRB(width / 3, 0, 0, 0),
    child: Row(
      children: <Widget>[
        Text(
          "سجل الدخول الي حسابك",
          style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.w200,
            fontSize: large ? 20 : (medium ? 17.5 : 15),
          ),
        ),
      ],
    ),
  );
}

Widget emailTextFormField({TextEditingController emailcont}) {
  return CustomTextField(
    keyboardType: TextInputType.emailAddress,
    textEditingController: emailcont,
    icon: Icons.email,
    hint: "البريد الالكتروني",
  );
}

//

Widget passwordTextFormField({TextEditingController passwordController}) {
  return CustomTextField(
    keyboardType: TextInputType.emailAddress,
    textEditingController: passwordController,
    icon: Icons.lock,
    obscureText: true,
    hint: "كلمة السر",
  );
}

Widget forgetPassTextRow(
    {double width, double height, bool large, bool medium}) {
  return Container(
    margin: EdgeInsets.only(top: height / 40.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "طلب كلمة سر جديده",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.w600,
              color: Colors.orange[200]),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "هل نسيت كلمة السر؟",
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.w400,
              fontSize: large ? 14 : (medium ? 12 : 10)),
        )
      ],
    ),
  );
}

Widget loginButton(
    {double width,
    double height,
    bool large,
    bool medium,
    Function singIn_method,
    BuildContext context}) {
  return RaisedButton(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    onPressed: () {
      singIn_method();
    },
    textColor: Colors.white,
    padding: EdgeInsets.all(0.0),
    child: Container(
        alignment: Alignment.center,
        width: large ? width / 4 : (medium ? width / 3.75 : width / 3.5),
        decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    gradient: LinearGradient(
      colors: <Color>[Colors.orange[200], Colors.orange],
    ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('تسجيل الدخول',
      style: TextStyle(
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
          fontSize: large ? 14 : (medium ? 12 : 10))),
      ),
  );
}

Widget signUpTextRow(
    {double width,
    double height,
    bool large,
    bool medium,
    BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(top: height / 120.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Regestration_Screen.id);
          },
          child: Text(
            "   انشاء حساب جديد ",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.w800,
                color: Colors.orange[200],
                fontSize: large ? 19 : (medium ? 17 : 15)),
          ),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    ),
  );
}

Container loginLogo_container({
  double width,
  double height,
  bool large,
  bool medium,
}) {
  return Container(
    alignment: Alignment.bottomCenter,
    margin: EdgeInsets.only(
        top: large ? height / 30 : (medium ? height / 25 : height / 20)),
    child: Hero(
      tag: 'mylogotag',
      child: Image.asset(
        'assets/img/appIcon.png',
        height: height / 4.5,
        width: width / 2.5,
      ),
    ),
  );
}
