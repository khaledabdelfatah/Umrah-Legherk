import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

Stack HomeStack(
    {String userImgLink,
    BuildContext context,
    Function openDrawer,
    String username,
    Key formKey}) {
  return Stack(
    children: <Widget>[
      Container(
        height: 250.0,
        // width: double.infinity,
        color: new Color(0xFFFDD148),
      ),
      Positioned(
        bottom: 50.0,
        right: 100.0,
        child: Container(
          height: 400.0,
          width: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200.0),
            color: new Color(0xFFFEE16D).withOpacity(0.4),
            // .withOpacity(0.4)
          ),
        ),
      ),
      Positioned(
        bottom: 100.0,
        left: 150.0,
        child: Container(
          height: 300.0,
          width: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150.0),
            color: Color(0XFFFEE16D).withOpacity(0.5),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              SizedBox(width: 15.0),
              Container(
                alignment: Alignment.topLeft,
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 2.0),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      alignment: Alignment.centerLeft,
                      image: userImgLink == null
                          ? AssetImage('assets/img/appIcon.png')
                          : NetworkImage(
                              userImgLink,
                            ),
                    )),
              ),
              SizedBox(width: MediaQuery.of(context).size.width - 120.0),
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: openDrawer,
                  color: Colors.white,
                  iconSize: 30.0,
                ),
              ),
              SizedBox(height: 15.0),
            ],
          ),
          SizedBox(height: 50.0),
          Center(
            child: Text(
              // 'مرحبا بك $testname',
              ' مرحبا بك $username',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'ماذا لديك لتشاركه الناس اليوم؟',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(5.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                    key: formKey,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search,
                            color: Colors.orange, size: 30.0),
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        hintText: '  قم بالبحث  ',
                        // alignLabelWithHint: true,

                        hintStyle: TextStyle(
                          // textBaseline: TextBaseline.alphabetic,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          inherit: true,
                          wordSpacing: 2.0,
                          fontFamily: ArabicFonts.Tajawal,
                          package: 'google_fonts_arabic',
                        ))),
              ),
            ),
          ),
          SizedBox(height: 10.0)
        ],
      )
    ],
  );
}
