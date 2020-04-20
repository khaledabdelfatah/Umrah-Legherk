import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:umruh_lgherak/Screens/FAQ.dart';
import 'package:umruh_lgherak/Screens/RequestDetails.dart';

import 'package:umruh_lgherak/Screens/welcome_screen.dart';
import 'package:umruh_lgherak/Services/getTopVol.dart';
import 'package:umruh_lgherak/Widgets/home/FABandBOTTOMBAR.dart';
import 'package:umruh_lgherak/Widgets/home/HomeTopWidget.dart';
import 'package:umruh_lgherak/Widgets/home/buildHor_list.dart';
import 'package:umruh_lgherak/Widgets/home/buildList_Item.dart';
import 'package:umruh_lgherak/Widgets/home/completed_Request.dart';
import 'package:umruh_lgherak/Widgets/home/homeDrawer_widger.dart';
import 'package:umruh_lgherak/Widgets/home/loading-Widget.dart';


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
  String userPhoneNumber = '';
  FirebaseUser user;
  FirebaseAuth _auth;
  String customStringRating = ' ';
  getCurrentUser() async {
    _auth = FirebaseAuth.instance;
    user = await _auth.currentUser();
    var docRef = Firestore.instance.collection('users').document(user.uid);
    docRef.get().then((document) {
      print(document['profile_img_link'] + 'From Home Screen.dart');
      setState(() {
        userEmail = document['email'];
        username = document['name'];
        userImgLink = document['profile_img_link'];
        userPhoneNumber = document['phone_number'];
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

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    GetTopVolounters topVolounters = GetTopVolounters();
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.orange, // status bar color
    ));
     double height = MediaQuery.of(context).size.height;
    var children2 = <Widget>[
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

      Container(
          height: 200,
          // width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: topVolounters.getTopVoluntersData(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: loadingWidget(),
                  );
                } else if (snapShot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapShot.data.length,
                      itemBuilder: (context, index) {
                        return buildList(
                            bgColor: Color(0xFFFFE9C6),
                            name: snapShot.data[index].data['name'],
                            imgPath:
                                snapShot.data[index].data['profile_img_link'] ==
                                        null
                                    ? AssetImage(
                                        'assets/img/appIcon.png',
                                      )
                                    : NetworkImage(snapShot
                                        .data[index].data['profile_img_link']),
                            numberofVol: snapShot
                                .data[index].data['number_ofVolunteering'],
                            textColor: Color(0xFFDA9551),
                            cheight: height);
                      });
                } else {
                  print('Helo World');
                }
              })),

      // title: Text(snapShot.data[index].data['title']),
/** */
      Divider(
        color: Colors.orange,
      ),
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
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: topVolounters.getUncomplettedRequest(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: loadingWidget(),
                  );
                } else if (snapShot.hasData) {
                  return SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        addAutomaticKeepAlives: true,
                        dragStartBehavior: DragStartBehavior.start,
                        scrollDirection: Axis.vertical,
                        itemCount: snapShot.data.length,
                        itemBuilder: (context, index) {
                          return buildListItem(
                              foodName: snapShot.data[index].data['title'],
                              imgPath:
                                  snapShot.data[index].data['Pic_url'] == null
                                      ? AssetImage(
                                          'assets/img/appIcon.png',
                                        )
                                      : NetworkImage(
                                          snapShot.data[index].data['Pic_url']),
                              date: snapShot.data[index].data['puplished_date'],
                              showRequestDetails: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ViewDetalis(
                                              imgLink: snapShot
                                                  .data[index].data['Pic_url'],
                                              phoneNumber: snapShot.data[index]
                                                  .data['phoneNumber'],
                                              publisedDate: snapShot.data[index]
                                                  .data['puplished_date'],
                                              reqDetalis: snapShot.data[index]
                                                  .data['request_details'],
                                              title: snapShot
                                                  .data[index].data['title'],
                                              puplisherName: snapShot
                                                  .data[index]
                                                  .data['puplisher'],
                                              status: snapShot.data[index]
                                                  .data['person_status'],
                                              requestPublisher: snapShot
                                                  .data[index].documentID,
                                            )));
                              });
                        }),
                  );
                } else {
                  return Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "لا يوجد طلبات بالتطوع",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
      Divider(color: Colors.orange),

      Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "اخر الطلبات التي تم التطوع لها",
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
      SizedBox(
        height: 10,
      ),
      //////////////////////
      Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: topVolounters.getCompletedRequest(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: loadingWidget(),
                  );
                } else if (snapShot.hasData) {
                  return ListView.custom(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                      right: 10,
                    ),

                    childrenDelegate:
                        SliverChildBuilderDelegate((context, index) {
                      return completedRequestCard(
                          context: context,
                          imgPath: snapShot.data[index].data['Pic_url'] == null
                              ? AssetImage('assets/img/appIcon.png')
                              : NetworkImage(
                                  snapShot.data[index].data['Pic_url']),
                          personName: snapShot.data[index].data['title'],
                          volName: snapShot
                              .data[index].data['volunteerPerson_name']);
                    }, childCount: snapShot.data.length),

                    // *  completedRequestCard(
                    //       context: context,
                    //       imgPath: AssetImage('assets/img/appIcon.png'),
                    //       personName: "Khaelex",
                    //       volName: "Abo Nesma"),
                  );
                } else {
                  return Text(
                    "لا يوجد طلبات تم التطوع لها",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  );
                }
              })),

      ///
    ];
    return Scaffold(
      bottomNavigationBar: HomeBottomBar(),
      floatingActionButton: HomeFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      key: _scaffoldKey,
      body: ListView(
        children: <Widget>[
          Column(
            children: children2,
          ),
          //
          SizedBox(
            height: 20,
          ),

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
            Alert(
                context: context,
                title: 'هل تريد تسجيل الخروج؟',
                closeFunction: () {
                  Navigator.pop(context);
                },
                style: AlertStyle(
                    titleStyle: TextStyle(
                        color: Colors.red,
                        fontFamily: ArabicFonts.Tajawal,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800),
                    animationType: AnimationType.shrink,
                    descStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)),
                type: AlertType.warning,
                desc:
                    'هل انت متاكد من انك تريد تسجيل الخروج, لا يمكنك التراجع  ',
                buttons: [
                  DialogButton(
                    color: Colors.red,
                    child: Text(
                      "سجل الخروج",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.pushNamedAndRemoveUntil(context, WelcomePage.id,
                          (Route<dynamic> route) => false);
                    },
                  ),
                  DialogButton(
                    color: Colors.green,
                    child: Text(
                      "الصفحه الرئيسيه",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ]).show();
          }),
    );
  }
}
