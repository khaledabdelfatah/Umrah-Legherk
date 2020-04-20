import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:umruh_lgherak/Widgets/login_regestration/responsive.dart';
import 'package:umruh_lgherak/Widgets/welcomepage/welcomeScreen_Widget.dart';

class WelcomePage extends StatefulWidget {
  static final id = "welcomePage";
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  Widget build(BuildContext context) {
    // prevent Rotation
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: _height,
            width: _width,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(30, 25, 25, 1.00),
                      Color.fromRGBO(30, 25, 25, 1.00)
                    ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),

                log_avatarGlow(),

                title(context),

                SizedBox(
                  height: 20,
                ),

                submitButton(context),

                SizedBox(
                  height: 20,
                ),

                signUpButton(context),

                SizedBox(
                  height: 20,
                ),

                // [واتمو الحج والعمرة لله]
                //  ListTile(title: label(),),
                Padding(padding: EdgeInsets.only(bottom: 40))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
