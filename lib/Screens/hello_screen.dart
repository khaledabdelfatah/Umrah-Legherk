import 'dart:async';
import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:umruh_lgherak/Screens/home_screen.dart';

// String name;
class Hello_Screen extends StatefulWidget {
  static final String id = 'hello_screen';

  @override
  _Hello_ScreenState createState() => _Hello_ScreenState();
}

class _Hello_ScreenState extends State<Hello_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: AnimatedBackground()),
          onBottom(AnimatedWave(
            height: 180,
            speed: 1.0,
          )),
          onBottom(AnimatedWave(
            height: 120,
            speed: 0.9,
            offset: pi,
          )),
          onBottom(AnimatedWave(
            height: 220,
            speed: 1.2,
            offset: pi / 2,
          )),
          Positioned.fill(child: CenteredText()),
        ],
      ),
    );
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}

class AnimatedWave extends StatefulWidget {
  final double height;
  final double speed;
  final double offset;

  AnimatedWave({this.height, this.speed, this.offset = 0.0});

  @override
  _AnimatedWaveState createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: widget.height,
        width: constraints.biggest.width,
        child: ControlledAnimation(
            playback: Playback.LOOP,
            duration: Duration(milliseconds: (5000 / widget.speed).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (context, value) {
              return CustomPaint(
                foregroundPainter: CurvePainter(value + widget.offset),
              );
            }),
      );
    });
  }
}

class CurvePainter extends CustomPainter {
  final double value;

  CurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = Colors.white.withAlpha(60);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900)),
      Track("color2").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}

class CenteredText extends StatefulWidget {
  @override
  _CenteredTextState createState() => _CenteredTextState();
}

class _CenteredTextState extends State<CenteredText> {
  String displayedname = '';
  Getname() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    var document =
        await Firestore.instance.collection('users').document(user.uid);
    document.get().then((document) {
      print(document['name']);
      setState(() {
        displayedname = document['name'];
      });
      Timer(Duration(seconds: 4), () {
        Navigator.pushReplacementNamed(context, Home_Screen.id);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getname();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              " مرحبا بك معنا يا ",
              style: TextStyle(
                fontSize: 30,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: ArabicFonts.Changa,
                package: 'google_fonts_arabic',
              ),
              textDirection: TextDirection.rtl,
            ),
            Text(
              displayedname,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: ArabicFonts.Katibeh,
                package: 'google_fonts_arabic',
              ),
            ),
            Text(
              "نحن سعداء بكونك انضممت الينا,نتمني لك تجربه ممتعه ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
              ),
              textDirection: TextDirection.rtl,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "وتذكر دائما",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
              ),
              textDirection: TextDirection.rtl,
            ),
            Text(
              "\"اصنع الخير لك وللناس\"",
              style: TextStyle(
                fontSize: 40,
                // fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontFamily: ArabicFonts.Jomhuria,
                package: 'google_fonts_arabic',
              ),
              textDirection: TextDirection.rtl,
            ),
            // Text("نحن سعداء بكونك انضممت الينا,نتمني لك تجربه ممتعه ",
            //     style: TextStyle(
            //       fontSize: MediaQuery.of(context).size.width / 10,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //       fontFamily: ArabicFonts.Cairo,
            //       package: 'google_fonts_arabic',
            //     )),
            // SizedBox(
            //   height: 10,
            // ),
            // Center(
            //   child: Text(displayedname,
            //       style: TextStyle(
            //         color: Colors.orange,
            //         fontSize: MediaQuery.of(context).size.width / 7,
            //         fontFamily: ArabicFonts.Amiri,
            //         package: 'google_fonts_arabic',
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
