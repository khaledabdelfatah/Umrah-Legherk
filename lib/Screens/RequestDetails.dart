import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:umruh_lgherak/Screens/home_screen.dart';
import 'package:umruh_lgherak/Services/volunteerToRequest.dart';
import 'package:umruh_lgherak/Widgets/RequestDetelis/detelisWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewDetalis extends StatefulWidget {
  static String id = 'DetailsScreen';
  final String imgLink;
  final String publisedDate;
  final String title;
  final String reqDetalis;
  final String phoneNumber;
  final requestPublisher;
  final String status;
  final String puplisherName;
  ViewDetalis(
      {this.imgLink,
      this.publisedDate,
      this.title,
      this.requestPublisher,
      this.status,
      this.puplisherName,
      this.reqDetalis,
      this.phoneNumber});
  @override
  _ViewDetalisState createState() => _ViewDetalisState();
}

class _ViewDetalisState extends State<ViewDetalis> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    print('userid in the requst is' + widget.status);
  }

  String currentUserName = '';
  FirebaseUser user;
  FirebaseAuth _auth;
  getCurrentUser() async {
    _auth = FirebaseAuth.instance;
    user = await _auth.currentUser();
    var docRef = Firestore.instance.collection('users').document(user.uid);
    docRef.get().then((document) {
      setState(() {
        currentUserName = document['name'];
      });
    });
    print(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Image.network(
                                    widget.imgLink,
                                  ),
                                );
                              });
                        },
                        child: Container(
                          height: 275.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.imgLink) == null
                                      ? AssetImage("assets/img/appIcon.png")
                                      : NetworkImage(widget.imgLink),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'تاريخ النشر ${widget.publisedDate}',
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 15.0,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            'عمره لـ :- ',
                            style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontSize: 25.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 5)),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontSize: 25.0,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      'التفاصيل:',
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          widget.reqDetalis,
                          style: TextStyle(
                            fontFamily: ArabicFonts.Changa,
                            package: 'google_fonts_arabic',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontFeatures: [FontFeature.slashedZero()],
                            color: Colors.orange,
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 15.0),
                  //   child: Text(
                  //     'COLOR',
                  //     style: TextStyle(
                  //         fontFamily: 'Montserrat',
                  //         fontSize: 22.0,
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),

                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'الحاله :-',
                          style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        widget.status,
                        style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 25.0,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Text(
                        "ناشر الطلب :-",
                        style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 25.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.puplisherName,
                        style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 22.0,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Material(
            elevation: 7.0,
            color: Colors.white,
            child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10.0),
                      InkWell(
                        onTap: () async {
                         launchWhatsapp(context: context,phNumber: widget.phoneNumber);
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Image.asset('assets/img/whatsIcon1.png'),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          launchPhoneNumber(
                              context: context, pnumber: widget.phoneNumber);
                        },
                        child: Container(
                            height: 50.0,
                            width: 50.0,
                            color: Colors.white,
                            child: Image.asset(
                              'assets/img/callIcon3.png',
                              color: Colors.green,
                            )),
                      ),
                      Container(
                          color: Colors.orange,
                          width: MediaQuery.of(context).size.width - 130.0,
                          child: InkWell(
                            onTap: () {
                              Alert(
                                context: context,
                                type: AlertType.warning,
                                title: "هل انت متاكد؟",
                                desc:
                                    " هل انت متاكد من انك تريد التطوع لهذا الطلب ,, لا يمكنك التراجع في قرارك!",
                                style: AlertStyle(
                                  descStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      package: 'google_fonts_arabic',
                                      fontFamily: ArabicFonts.Tajawal),
                                  titleStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                      package: 'google_fonts_arabic',
                                      fontFamily: ArabicFonts.Cairo),
                                ),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "لا لست متاكد",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: ArabicFonts.Tajawal,
                                        fontWeight: FontWeight.w600,
                                        package: 'google_fonts_arabic',
                                      ),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color.fromRGBO(0, 179, 134, 1.0),
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "نعم ,انا متاكد",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: ArabicFonts.Tajawal,
                                        fontWeight: FontWeight.w700,
                                        package: 'google_fonts_arabic',
                                      ),
                                    ),
                                    onPressed: () {
                                      // onPressed Function That happens when user make sure that he would like to make the request
                                      // try{
                                      updateInfo(
                                          id: widget.requestPublisher,
                                          volunteerPerson: currentUserName,
                                          context: context);

                                      try {
                                        Navigator.pop(context);
                                        Alert(
                                            content: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    InkWell(
                                                      onTap: launchWhatsapp(
                                                          phNumber: widget
                                                              .phoneNumber,
                                                          context: context),
                                                      child: Container(
                                                        height: 50.0,
                                                        width: 50.0,
                                                        color: Colors.white,
                                                        child: Image.asset(
                                                            'assets/img/whatsIcon1.png'),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: (){
                                                       launchPhoneNumber(context: context,pnumber: widget.phoneNumber);
                                                      },
                                                                                                          child: Container(
                                                          height: 50.0,
                                                          width: 50.0,
                                                          color: Colors.white,
                                                          child: Image.asset(
                                                            'assets/img/callIcon3.png',
                                                            color: Colors.green,
                                                          )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            context: context,
                                            buttons: [
                                              DialogButton(
                                                  child: Text(
                                                    "الانتقال للصفحه الرئيسيه",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontFamily:
                                                          ArabicFonts.Tajawal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      package:
                                                          'google_fonts_arabic',
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                            context,
                                                            Home_Screen.id);
                                                  })
                                            ],
                                            title: "شكرا لك",
                                            desc:
                                                " شكرا لتطوعك, تاكد من تواصلك مع صاحب الطلب من خلال اي وسيله موجوده في البرنامج او يمكنك الضغط علي اي ايقونه لللتواصل",
                                            image: Image.asset(
                                                "assets/img/5de.gif"),
                                            closeFunction: () =>
                                                Navigator.pushReplacementNamed(
                                                    context, Home_Screen.id),
                                            style: AlertStyle(
                                              titleStyle: TextStyle(
                                                color: Colors.green,
                                                fontSize: 37,
                                                fontFamily:
                                                    ArabicFonts.Aref_Ruqaa,
                                                fontWeight: FontWeight.w700,
                                                package: 'google_fonts_arabic',
                                              ),
                                              descStyle: TextStyle(
                                                color: Colors.green,
                                                fontSize: 15,
                                                fontFamily: ArabicFonts.Cairo,
                                                fontWeight: FontWeight.w700,
                                                package: 'google_fonts_arabic',
                                              ),
                                            )).show();
                                      } catch (e) {
                                        print(e.toString());
                                      }
                                    },
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(116, 116, 191, 1.0),
                                      Color.fromRGBO(52, 138, 199, 1.0)
                                    ]),
                                  )
                                ],
                              ).show();
                            },
                            child: Center(
                                child: Text(
                              'تطوع الان لهذا الطلب',
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Changa,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  package: 'google_fonts_arabic',
                                  color: Colors.white),
                            )),
                          ))
                    ]))),
      ),
    );
  }
}
