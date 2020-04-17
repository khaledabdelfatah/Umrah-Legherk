import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:umruh_lgherak/Widgets/home/whoAmI.dart';

Drawer homeDrawer(
    {BuildContext context,
    var username,
    var userEmail,
    var userImgLink,
    double height,
    Function singOut,
    Function FAQ_Function}) {
  return Drawer(
      child: ListView(
    children: <Widget>[
      // DrawerHeader(child: Text("ss")),

      UserAccountsDrawerHeader(
        otherAccountsPictures: <Widget>[
          //
          InkWell(
              onTap: singOut,
              child: Icon(
                Icons.exit_to_app,
                color: Colors.red,
                size: 30,
              ))
          //
        ],
        accountName: Padding(
          padding: const EdgeInsets.only(top:25.0),
          child: Text(
            username,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white ,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
            ),
          ),
        ),
        accountEmail: Text(
          "$userEmail",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
          textWidthBasis: TextWidthBasis.longestLine,
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 1,
                  spreadRadius: 4.0,
                  offset: Offset(0.0, 0.3))
            ],
            color: Colors.white.withOpacity(0.0),
            // backgroundBlendMode: ,
            image: DecorationImage(
                alignment: Alignment.center,
                //  centerSlice: Rect.fsromCircle(center: Offset(.0, 1),radius: 20),
                image: AssetImage(
                  'assets/img/kaaba2.jpg',
                ),
                fit: BoxFit.cover)),
        currentAccountPicture: Container(
          height: height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: new Container(
              width: 120.0,
              height: 190.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: userImgLink == null
                      ? AssetImage('assets/img/appIcon.png')
                      : NetworkImage(userImgLink),
                ),
              )),
        ),
      ),

      // Padding(padding: EdgeInsets.only(top: 10)),
      drawerCustum_widget(
          icon: Icons.supervisor_account,
          title: "الصفحه الشخصيه",
          navigateingFunction: () {},
          context: context),
      Divider(),
      drawerCustum_widget(
          icon: Icons.message,
          title: "الرسائل",
          navigateingFunction: () {},
          context: context),
      Divider(),
      drawerCustum_widget(
          icon: Icons.help_outline,
          title: "الاسئله الشائعه",
          context: context,
          navigateingFunction: FAQ_Function),

      Divider(),
      drawerCustum_widget(
          navigateingFunction: () {},
          icon: Icons.timeline,
          title: "تتبع طلبك",
          context: context),

      Divider(),

      drawerCustum_widget(
          navigateingFunction: () {},
          icon: Icons.forum,
          title: "تواصل معنا",
          context: context),

      Divider(),
      drawerCustum_widget(
          navigateingFunction: () {
            c(context);
          },
          icon: Icons.format_quote,
          title: "من انا؟",
          context: context),

      Divider(),
      ListTile(
        title: Text("اصنع الخير لك وللناس",
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontFamily: ArabicFonts.Aref_Ruqaa,
                package: 'google_fonts_arabic',
                color: Colors.blueGrey,
                fontSize: MediaQuery.of(context).size.width / 13)),
      ),

      // Padding(
      //   padding: EdgeInsets.symmetric(vertical: 16.0),
      //   child:
      // ),
    ],
  ));
}

ListTile drawerCustum_widget(
    {String title,
    IconData icon,
    BuildContext context,
    Function navigateingFunction}) {
  return ListTile(
    // leading: Icon(icon,color: Colors.orange,
    // size: MediaQuery.of(context).size.width/15,),
    onTap: navigateingFunction,
    title: Text(title,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontFamily: ArabicFonts.Tajawal,
            package: 'google_fonts_arabic',
            color: Colors.orange[900],
            fontSize: MediaQuery.of(context).size.width / 15)),
    dense: true,
    //  enabled: true,

    // subtitle: Icon(Icons.dashboard),
    trailing: Icon(
      icon,
      color: Colors.orange,
      size: MediaQuery.of(context).size.width / 15,
    ),
  );
}
