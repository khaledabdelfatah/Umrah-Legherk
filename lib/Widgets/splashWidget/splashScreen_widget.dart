import 'package:flutter/material.dart';

// Logo Shown in the Splash Screen
Hero splashScreenlogo(BuildContext context) {
  return Hero(
    tag: 'mylogotag',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Container(
          child: Image.asset(
        "assets/img/appIcon.png",
        fit: BoxFit.scaleDown,
      )),
      radius: MediaQuery.of(context).size.height / 4.5,
    ),
  );
}

// Circular Indicator Shown In the Splash Screen

Expanded circularIndicator() {
  return Expanded(
    flex: 1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
        ),
      ],
    ),
  );
}

//  This is White Mosque Shown in the bottom of splash Screen

Container bottomMosqueImage(BuildContext context) {
  return Container(
    height: 150,
    width: MediaQuery.of(context).size.width,
    child: Stack(
      // fit: StackFit.passthrough,
      // overflow: Overflow.clip,
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Image.asset(
          "assets/img/bottomMosqueImage.png",
          color: Colors.grey[50],
        )
      ],
    ),
  );
}
