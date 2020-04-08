import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class ViewDetalis extends StatefulWidget {
  final String imgLink;
  final String publisedDate;
  final String title;
  final String reqDetalis;
  final String phoneNumber;

  ViewDetalis(
      {this.imgLink,
      this.publisedDate,
      this.title,
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
  }

  FirebaseUser user;
  FirebaseAuth _auth;
  getCurrentUser() async {
    _auth = FirebaseAuth.instance;
    user = await _auth.currentUser();
    var docRef = Firestore.instance.collection('users').document(user.uid);
    docRef.get().then((document) {
      print(document['profile_img_link'] + 'From Home Screen.dart');
      setState(() {});
    });
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: (MediaQuery.of(context).size.width / 4 +
                                    MediaQuery.of(context).size.width / 2) -
                                10.0,
                            child: Text(
                              widget.reqDetalis,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'COLOR',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Color(0xff5A5551)),
                          ),
                          SizedBox(width: 15.0),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Color(0xffC3BCB5)),
                          ),
                          SizedBox(width: 15.0),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Color(0xffEFEFEF)),
                          )
                        ],
                      )),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'MATERIAL',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                              height: 50.0,
                              width: 50.0,
                              child: Icon(Icons.time_to_leave,
                                  color: Colors.grey, size: 30.0)),
                          Text(
                            'x30%',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10.0),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            child: Icon(
                              Icons.timer,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            'x60%',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10.0),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            child: Icon(
                              Icons.monetization_on,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            'x10%',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
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
                        onTap: () {},
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Image.asset('assets/img/whatsIcon.png'),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
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
                          child: Center(
                              child: Text(
                            'تطوع الان لهذا الطلب',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )))
                    ]))),
      ),
    );
  }
}
