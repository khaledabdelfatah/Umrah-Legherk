import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:umruh_lgherak/Screens/FAQ.dart';

import 'package:umruh_lgherak/Screens/welcome_screen.dart';
import 'package:umruh_lgherak/Services/getTopVol.dart';
import 'package:umruh_lgherak/Widgets/home/FABandBOTTOMBAR.dart';
import 'package:umruh_lgherak/Widgets/home/HomeTopWidget.dart';
import 'package:umruh_lgherak/Widgets/home/buildHor_list.dart';
import 'package:umruh_lgherak/Widgets/home/buildList_Item.dart';
import 'package:umruh_lgherak/Widgets/home/homeDrawer_widger.dart';

class Home_Screen extends StatefulWidget {
  static String id = 'Home_Screen';
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var userImgLink;
  String userEmail = '';
  String username = '';
  var testname = 'Khaled ';
  FirebaseUser user;
  FirebaseAuth _auth;
  getCurrentUser() async {
    _auth = FirebaseAuth.instance;
    user = await _auth.currentUser();
    var docRef = Firestore.instance.collection('users').document(user.uid);
    docRef.get().then((document) {
      print(document['profile_img_link']);
      setState(() {
        userEmail = document['email'];
        username = document['name'];
        userImgLink = document['profile_img_link'];
      });
    });
  }

  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  printToken() async {
    var token = await _firebaseMessaging.getToken();
    final FirebaseUser user = await _auth.currentUser();
    // print(user.uid);
    try {
      CollectionReference usercollection =
          Firestore.instance.collection('users');

      return await usercollection.document(user.uid).updateData({
        'token': token,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    printToken();
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print("On Message $message");
      final notifysnackbar = SnackBar(
        content: Text(message['notification']['title']),
      );
      Scaffold.of(context).showSnackBar(notifysnackbar);
    }, onResume: (Map<String, dynamic> message) async {
      print("On Resume $message");
    }, onLaunch: (Map<String, dynamic> message) async {
      print("On Lanuch  $message");
    });
  }

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    GetTopVolounters topVolounters = GetTopVolounters();
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.pink, // status bar color
    ));
//For TEST ONLY TODO:
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: HomeBottomBar(),
      floatingActionButton: HomeFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      key: _scaffoldKey,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              HomeStack(
                  context: context,
                  userImgLink: userImgLink,
                  openDrawer: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                  formKey: _formKey,
                  username: username),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    textDirection: TextDirection.rtl,
                    color: Colors.orangeAccent[400],
                  ),
                  Text(
                    '\"افضل المتطوعين لهذا الشهر \"',
                    // textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.deepOrange,
                        // backgroundColor: Colors.teal.withOpacity(.2),
                        fontWeight: FontWeight.w600,
                        fontFamily: ArabicFonts.Amiri,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0),
                  ),
                  Icon(
                    Icons.star,
                    textDirection: TextDirection.rtl,
                    color: Colors.orangeAccent[400],
                  ),
                ],
              ),
//TODO:IMPORTSNT
              //        buildList(
              // bgColor: Color(0xFFFFE9C6),
              //       name: username,
              //       imgPath:userImgLink==null?AssetImage('assets/Icon1.png'):
              //      NetworkImage(userImgLink) ,
              //       numberofVol: 22,
              //       textColor: Color(0xFFDA9551),
              //       cheight: height
              //       ),

              Container(
                  height: 200,
                  // width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                      future: topVolounters.getData(),
                      builder: (context, snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Text(
                              "جار التحميل ,, برجاء الانتظار ",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w700,
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapShot.data.length,
                              itemBuilder: (context, index) {
                                return buildList(
                                    bgColor: Color(0xFFFFE9C6),
                                    name: snapShot.data[index].data['name'],
                                    imgPath: snapShot.data[index]
                                                .data['profile_img_link'] ==
                                            null
                                        ? AssetImage(
                                            'assets/img/appIcon.png',
                                          )
                                        : NetworkImage(snapShot.data[index]
                                            .data['profile_img_link']),
                                    numberofVol: snapShot.data[index]
                                        .data['number_ofVolunteering'],
                                    textColor: Color(0xFFDA9551),
                                    cheight: height);
                              });
                        }
                      })),

              // title: Text(snapShot.data[index].data['title']),

              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "اخر الطلبات",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.w700,
                        fontFamily: ArabicFonts.El_Messiri,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                  ],
                ),
              ),

              // Recent Requests
              Container(
                child: FutureBuilder(
                    future: topVolounters.get2Data(),
                    builder: (context, snapShot) {
                      if (snapShot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Text("  Im Loading"),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapShot.data.length,
                            itemBuilder: (context, index) {
                              return buildListItem(
                                  foodName: snapShot.data[index].data['title'],
                                  imgPath: snapShot
                                              .data[index].data['Pic_url'] ==
                                          null
                                      ? AssetImage(
                                          'assets/img/appIcon.png',
                                        )
                                      : NetworkImage(
                                          snapShot.data[index].data['Pic_url']),
                                  date: snapShot
                                      .data[index].data['puplished_date'],
                                  showRequestDetails: () {
                                    showBottomSheet(
                                        context: context,
                                         builder: (context) {
                                          return Center(
                                            child: InkWell(
                                              onTap: ()=>Navigator.pop(context),
                                                                                          child: Text(snapShot
                                                      .data[index].data['title'] +
                                                  ' Is Pressed'),
                                            ),
                                          );
                                        });
                                    //  Text(snapShot.data[index].data['title'] +
                                    //       ' Is Pressed');
                                  });
                            });
                      }
                    }),
              )

              // buildListItem(
              //   foodName: 'Khaeald',
              //   imgPath: AssetImage('assets/111.jpg'),
              //   price: '22',
              // ),
            ],
          ),
          //

          //
        ],
      ),
      drawerDragStartBehavior: DragStartBehavior.start,
      endDrawer: homeDrawer(
          context: context,
          height: height,
          userEmail: userEmail,
          userImgLink: userImgLink,
          username: username,
          FAQ_Function: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, FAQ.id);
          },
          singOut: () async {
            await _auth.signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, WelcomePage.id, (Route<dynamic> route) => false);
          }),
    );
  }
}
