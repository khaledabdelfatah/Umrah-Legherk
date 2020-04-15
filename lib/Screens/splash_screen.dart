
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umruh_lgherak/Screens/introScreen.dart';
import 'package:umruh_lgherak/Screens/welcome_screen.dart';
import 'package:umruh_lgherak/Widgets/splashWidget/splashScreen_widget.dart';

import 'home_screen.dart';

class splash_Screen extends StatefulWidget {
  static final id = "Splash_Screen";
  @override
  _splash_ScreenState createState() => _splash_ScreenState();
}

class _splash_ScreenState extends State<splash_Screen> {
  isTheresUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
print('$_seen' +'From Spalsh Screen');
    if (_seen) {
      Navigator.of(context).pushReplacementNamed(IntroScreen.id);
    } else {
      await prefs.setBool('seen', true);

      if (user == null) {
        Timer(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacementNamed(WelcomePage.id);
        });
      } else {
        Timer(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacementNamed(Home_Screen.id);
          print(user.uid);
        });
      }
    }
  }

//

//
// Check First time
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacementNamed(IntroScreen.id);
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    isTheresUser();
  }

  @override
  Widget build(BuildContext context) {
    // Prevent Rotion
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: splashScreenlogo(context),
                    ),
                    // /**************************************/
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                  ],
                )),
              ),
              circularIndicator(),
              bottomMosqueImage(context),
            ],
          ),
        ],
      ),
    );
  }
}
