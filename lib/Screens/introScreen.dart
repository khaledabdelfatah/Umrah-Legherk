import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:umruh_lgherak/Screens/welcome_screen.dart';

class IntroScreen extends StatefulWidget {
  static final id = 'intro-Screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
  }

  void onDonePress() {
    Navigator.pushReplacementNamed(context, WelcomePage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new IntroSlider(
        slides: [
          new Slide(
            marginTitle: EdgeInsets.only(top: 35),
            marginDescription:
                EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 50),
            //  marginDescription: EdgeInsets.only(left:20, right = 20.0, top, bottom = 50.0),
            styleTitle: TextStyle(
              color: Colors.orange,
              fontSize: 40,
              fontFamily: ArabicFonts.Aref_Ruqaa,
              package: 'google_fonts_arabic',
            ),
            colorBegin: Color(0xff203152),
            colorEnd: Colors.orange,
            styleDescription: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic'),
            title: "مرحبا بك معنا ",
            description: "شكرا لتنزيلك البرنامج \nنتمني لك تجربه رائعه",
            pathImage: "assets/img/2.png",
            //  foregroundImageFit: BoxFit.cover,
            widthImage: 400,
            heightImage: 350,
            // backgroundColor: Colors.black
            backgroundColor: Color(0xff203152),
          ),
          new Slide(
            styleTitle: TextStyle(
              color: Colors.black,
              fontSize: 35,
              // backgroundColor: Colors.white70,
              fontFamily: ArabicFonts.Aref_Ruqaa,
              package: 'google_fonts_arabic',
            ),
            marginTitle: EdgeInsets.only(top: 25),
            marginDescription: EdgeInsets.only(top: 310),
            styleDescription: TextStyle(
                fontSize: 20,
                backgroundColor: Color(0xff2d726b),
                color: Colors.orange,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic'),
            // backgroundColor: Color.fromRGBO(228, 192, 156, 1.0),
            title: "مجاني بالكامل",
            description:
                "عمره لغيرك اول تطبيق يسهل التواصل بين الشخص الراغب في التطوع وبين طالب العمره \n مجانا وبدون اي رسوم",
            // pathImage: "assets/img/3.png",
            backgroundImage: "assets/img/3.png",
            backgroundImageFit: BoxFit.cover,
            backgroundOpacity: 1,
            // backgroundColor: Colors.black

            backgroundOpacityColor: Color(0xfe5c09d),
          ),
          new Slide(
            styleTitle: TextStyle(
                fontSize: 30,
                color: Colors.orange,
                fontFamily: ArabicFonts.Changa,
                package: 'google_fonts_arabic'),
            widthImage: 400,
            heightImage: 350,
            title: "ماذا تنتظر!؟ سجل الان",
            description:
                "قم بانشاء حساب الان وابدا في نشر طلبك او التطوع , فقط تتبع الخطوات",
            pathImage: "assets/img/1.png",
            // backgroundColor: Colors.black26,
            backgroundColor: Color.fromRGBO(30, 25, 25, 1.00),

            // backgroundColor: Color(0xff9932CC),
            styleDescription: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic'),
          ),
        ],
        nameSkipBtn: 'تخطي',
        nameNextBtn: 'التالي',
        namePrevBtn: 'السابق',
        nameDoneBtn: 'ابدا الان',
        styleNameDoneBtn: TextStyle(
            fontSize: 30,
            color: Colors.orange,
            fontFamily: ArabicFonts.Jomhuria,
            package: 'google_fonts_arabic'),
        styleNameSkipBtn: TextStyle(
            fontSize: 30,
            color: Colors.orange,
            fontFamily: ArabicFonts.Jomhuria,
            package: 'google_fonts_arabic'),
        onDonePress: this.onDonePress,
      ),
    );
  }
}
