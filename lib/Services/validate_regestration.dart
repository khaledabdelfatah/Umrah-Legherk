import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

String validateEmail({String email}) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (email.isEmpty) {
    print('email is empty');
    return 'البريد الالكتروني فارغ ';
  } else if (emailValid) {
    return '';
  } else {
    print("THIS EMAIL IS NOT VALIDE");
    return 'تاكد من ان الايميل صحيح';
  }
}

String validateName({String name}) {
  if (name.isEmpty) {
    print('NAME IS Empty');
    return " الاسم فارغ ";
  } else if (name.length >= 20 || name.length <= 3) {
    print('Name Length Shouldnt be greater than 20 and more than 3');
    return "يجب ان يكون عدد حروف الاسم اكبر من 3 واقل من20 ";
  } else {
    return "";
  }
}

String validtePhoneNumber({String phoneNumber}) {
  print(phoneNumber);

  if (phoneNumber.length == 0) {
    return 'برجاء كتابة رقم الهاتف';
  } else if (double.parse(
        phoneNumber,
      ) !=
      null) {
    return '';
  }
  return ('لايمكن ان يحتوي رقم الهاتف علي حروف ');
}
Future<bool> isValidPhoneNumber (

    {@required String phoneNumber,
    @required String isoCode}

)async {
 
  var _channel;
    return await _channel.invokeMethod('isValidPhoneNumber', {
    'phone_number': phoneNumber,
    'iso_code': isoCode,
  });
}
String validatePassword({String password}) {
  if (password.isEmpty) {
    return "تاكد من كتابة الرقم السري";
  } else if (password.length < 6) {
    return "يجب ان تكون كلمة السر اكبر من 6 احرف";
  } else {
    return "";
  }
}

String validateRePassword({String pass1, String rePass}) {
  if (rePass.length == 0) {
    return "تاكد من اعادة كتابة كلمة السر";
  }
  if (pass1 != rePass) {
    return "يجب ان يتطابق كلة السر";
  } else {
    return "";
  }
}

String cheakBoxValidate({bool val}) {
  if (val == false) {
    return "يجب قبول الشروط ";
  } else {
    return "";
  }
}

TextStyle errorStyle() {
  return TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w600,
    fontFamily: ArabicFonts.Tajawal,
    package: 'google_fonts_arabic',
  );
}
