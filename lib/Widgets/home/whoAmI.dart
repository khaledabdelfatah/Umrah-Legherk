//this dhould be a show ingo dialoge
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

c(
  context,
) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  // height: 350.0,
                  // width: 200.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(height: 150.0),
                          Container(
                            height: 100.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                    image: AssetImage('assets/img/aqsaa.jpg'),
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.fitWidth),
                                color: Colors.orange),
                          ),
/////////////////

                          ///////
                          Positioned(
                              top: 50.0,
                              left: 94.0,
                              child: Container(
                                height: 90.0,
                                width: 90.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45.0),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 2.0),
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/img/auther.jpg"),
                                        fit: BoxFit.cover)),
                              ))
                        ],
                      ),
                      // SizedBox(height: 10.0),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Khaled Abd El-Fatah",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  fontFamily: ArabicFonts.Changa,
                                  package: 'google_fonts_arabic',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  InkWell(
                                    onTap: ()async{
                            await      _launchmyLink(link: 'https://github.com/khaledabdelfatah/');     
                                    },
                                     child: Image.asset(
                                    'assets/img/github-logo.png',
                                  ),
                                  ),
                                  InkWell(
                                    onTap:
                                    ()async{
                                     _launchmyLink(link: 'https://www.linkedin.com/in/khaled-abd-elfatah/');},
                                    child: Image.asset(
                                        'assets/img/linkedin.png'),
                                  ),
                                  InkWell(
                                    onTap:()async{ _launchmyLink(link: 'https://www.facebook.com/khaloooda.abdelfatah');},
                                    child: Image.asset(
                                        'assets/img/facebook.png'),
                                  ),
                                ],
                              )
                            ],
                          )),
                      SizedBox(height: 15.0),
                      FlatButton(
                          child: Center(
                            child: Text(
                              'حسنا',
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontSize: 14.0,
                                  color: Colors.teal),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.transparent)
                    ],
                  ))),
        );
      });
}
_launchmyLink({String link}) async {
   var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}