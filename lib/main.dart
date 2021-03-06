import 'package:flutter/material.dart';
import 'package:umruh_lgherak/Screens/FAQ.dart';
import 'package:umruh_lgherak/Screens/NewRequestScreen.dart';
import 'package:umruh_lgherak/Screens/RequestDetails.dart';

import 'package:umruh_lgherak/Screens/hello_screen.dart';
import 'package:umruh_lgherak/Screens/home_screen.dart';
import 'package:umruh_lgherak/Screens/introScreen.dart';
import 'package:umruh_lgherak/Screens/splash_screen.dart';
import 'package:umruh_lgherak/Screens/login_screen.dart';
import 'package:umruh_lgherak/Screens/welcome_screen.dart';
import 'Screens/regestrationScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash_Screen(),
    routes: {
      splash_Screen.id: (context) => splash_Screen(),
      WelcomePage.id: (context) => WelcomePage(),
      LoginScreen.id: (context) => LoginScreen(),
      Regestration_Screen.id: (context) => Regestration_Screen(),
      Hello_Screen.id: (context) => Hello_Screen(),
      Home_Screen.id: (context) => Home_Screen(),
      FAQ.id: (context) => FAQ(),
      Request_Screen.id: (context) => Request_Screen(),
      ViewDetalis.id: (context) => ViewDetalis(),
      IntroScreen.id: (context) => IntroScreen()
    },
    theme: ThemeData(
      unselectedWidgetColor: Colors.pink,
      buttonTheme: ButtonThemeData(
        minWidth: 10,
      ),
      errorColor: Colors.red,
    ),
    title: 'عمره لغيرك',
  ));
}
