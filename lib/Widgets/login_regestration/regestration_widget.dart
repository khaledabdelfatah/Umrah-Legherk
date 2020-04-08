// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/textformfiled.dart';
import '../../Screens/login_screen.dart';

Widget fullNameTextFormField({TextEditingController fullNameController}) {
  return CustomTextField(
    textEditingController: fullNameController,
    keyboardType: TextInputType.text,
    icon: Icons.person,
    hint: "الاسم",
  );
}

Widget emailTextFormField({TextEditingController emailController}) {
  return CustomTextField(
    textEditingController: emailController,
    keyboardType: TextInputType.emailAddress,
    icon: Icons.email,
    hint: "البريد الالكتروني",
  );
}

Widget phoneTextFormField({TextEditingController phoneController}) {
  return CustomTextField(
    textEditingController: phoneController,
    keyboardType: TextInputType.number,
    icon: Icons.phone,
    hint: "رقم الهاتف",
  );
}

Widget passwordTextFormField({TextEditingController passController}) {
  return CustomTextField(
    textEditingController: passController,
    keyboardType: TextInputType.text,
    obscureText: true,
    icon: Icons.lock,
    lableText: "Password",
    hint: "كلمة السر",
  );
}

Widget repassword({TextEditingController rePassController}) {
  return CustomTextField(
    keyboardType: TextInputType.text,
    textEditingController: rePassController,
    obscureText: true,
    icon: Icons.lock_outline,
    hint: "كرر كلمة السر ",
  );
}

Widget acceptTermsTextRow(
    {double height,
    bool checkBoxValue,
    Function checkifisAccepted,
    bool large,
    bool medium}) {
  return Container(
    margin: EdgeInsets.only(top: height / 100.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          activeColor: Colors.orange[200],
          value: checkBoxValue,
          onChanged: checkifisAccepted,
        ),
        Text(
          "أوافق علي الشروط ",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.w400,
              fontSize: large ? 12 : (medium ? 11 : 10)),
        ),
      ],
    ),
  );
}
// / /////// //////

Widget creatingAccountButton({
  bool large,
  double width,
  bool medium,
  Function creatingAccount,
}) {
  return RaisedButton(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    onPressed: () => creatingAccount(),
    textColor: Colors.white,
    padding: EdgeInsets.all(0.0),
    child: Container(
      alignment: Alignment.center,
//        height: _height / 20,
      width: large ? width / 4 : (medium ? width / 3.75 : width / 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          colors: <Color>[Colors.orange[200], Colors.orange],
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        child: Text(
          'انشاء حساب',
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontSize: large ? 14 : (medium ? 12 : 10)),
        ),
      ),
    ),
  );
}

// /////////////////////// //
Widget signInTextRow({double height, BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(top: height / 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.id);
            print("Routing to Sign up screen");
          },
          child: Text(
            "لديك حساب؟ سجل الدخول",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.w800,
                color: Colors.orange[700],
                fontSize: 19),
          ),
        )
      ],
    ),
  );
}
