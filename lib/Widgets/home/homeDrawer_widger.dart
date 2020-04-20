import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:umruh_lgherak/Screens/home_screen.dart';
import 'package:umruh_lgherak/Services/feedback.dart';
import 'package:umruh_lgherak/Widgets/home/whoAmI.dart';

Drawer homeDrawer(
    {BuildContext context,
    var username,
    var userEmail,
    Scaffold sc,
    var userImgLink,
    double height,
    Function singOut,
    Function controllRating,
    Function FAQ_Function}) {
  double rate = 0.0;
  TextEditingController ratingController = TextEditingController();
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
          padding: const EdgeInsets.only(top: 25.0),
          child: Text(
            username,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white,
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
          navigateingFunction: () {
            Alert(
                style: AlertStyle(
                  animationType: AnimationType.fromTop,
                  isCloseButton: true,
                  isOverlayTapDismiss: true,
                  descStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontSize: 15.0,
                  ),
                  animationDuration: Duration(milliseconds: 400),
                  alertBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  titleStyle: TextStyle(
                    color: Colors.orange,
                    fontFamily: ArabicFonts.Aref_Ruqaa,
                    package: 'google_fonts_arabic',
                    fontSize: 25.0,
                  ),
                ),
                context: context,
                title: " شاركنا رايك ومقترحاتك",
                desc:
                    "شكرا علي استخدامك البرنامج , نتمني ان نري تقييمك ورايك لهذا البرنامج ",
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      new TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 2,
                        autofocus: false,
                        textAlign: TextAlign.right,
                        cursorColor: Colors.orange,
                        style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                        decoration: InputDecoration(
                          hintText: 'اكتب رايك',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.orange, style: BorderStyle.solid),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide(
                                  color: Colors.orange,
                                  style: BorderStyle.solid)),
                        ),
                        controller: ratingController,
                      ),
                      //Rating Bar
                      Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Center(
                            child: Text(
                              " او شاركنا رايك بايموجي ",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Aref_Ruqaa,
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                                color: Colors.orange,
                                package: 'google_fonts_arabic',
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RatingBar(
                          initialRating: 3,
                          glow: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                return Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.red,
                                );
                              case 1:
                                return Icon(
                                  Icons.sentiment_dissatisfied,
                                  color: Colors.redAccent,
                                );
                              case 2:
                                return Icon(
                                  Icons.sentiment_neutral,
                                  color: Colors.amber,
                                );
                              case 3:
                                return Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.lightGreen,
                                );
                              case 4:
                                return Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Colors.green,
                                );
                            }
                          },
                          onRatingUpdate: (rating) {
                            rate = rating;
                            print(rate);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                closeFunction: () {
                  Navigator.pop(context);
                },
                image: Image.asset(
                  'assets/img/feedback.png',
                  color: Colors.orange,
                  height: 150,
                  width: 150,
                ),
                buttons: [
                  DialogButton(
                    onPressed: () async {
                      if (ratingController.text == '' && rate == 0.0) {
                        print("No You Shouldent do this.");
                        Alert(
                            closeFunction: () => Navigator.pushReplacementNamed(
                                context, Home_Screen.id),
                            style: AlertStyle(
                                animationType: AnimationType.fromBottom,
                                isCloseButton: false,
                                titleStyle: TextStyle(
                                  fontFamily: ArabicFonts.Changa,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                  color: Colors.orange,
                                  package: 'google_fonts_arabic',
                                ),
                                descStyle: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.black,
                                  package: 'google_fonts_arabic',
                                )),
                            context: context,
                            title: "لم تقم بكتابة اي بيانات",
                            desc:
                                ' حتي نتمكن من معرفة ارائك ومقترحاتك يجب علي الاقل اختيار وسيلة واحده وهي كتابة رايك او التعبير عنه بايموجي ',
                            type: AlertType.error,
                            buttons: [
                              DialogButton(
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [Colors.black, Colors.white]),
                                child: Text(
                                  "حسنا",
                                  style: TextStyle(
                                    fontFamily: ArabicFonts.Cairo,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w800,
                                    package: 'google_fonts_arabic',
                                  ),
                                ),
                                onPressed: () => Navigator.pop(context),
                              )
                            ]).show();
                      } else {
                        await FeedbackService().submitFeedback(
                          rate: rate,
                          textFeedback: ratingController.text,
                        );
                        Navigator.pop(context);
                        Alert(
                            closeFunction: () => Navigator.pushReplacementNamed(
                                context, Home_Screen.id),
       

                               style: AlertStyle(
                                animationType: AnimationType.fromRight,
                                isCloseButton: false,
                                titleStyle: TextStyle(
                                  fontFamily: ArabicFonts.Changa,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                  color: Colors.orange,
                                  package: 'google_fonts_arabic',
                                ),
                                descStyle: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.black,
                                  package: 'google_fonts_arabic',
                                )),
                           
                            context: context,
                            title: "شكرا لك ",
                            desc:
                                'شكرا لك علي وقتك الذي قضيته اثناء اخبارنا برايك , سنحاول جاهدين من اجل رفع كفاءة التطبيق',
                            type: AlertType.success,
                            buttons: [
                              DialogButton(
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [Colors.orange, Colors.white]),
                                child: Text("حسنا",
                                style:TextStyle(
                                  package: 'google_fonts_arabic',
                                       fontFamily: ArabicFonts.Cairo,
                                  fontWeight: FontWeight.w800,
                                ) ,
                                ),
                                onPressed: () => Navigator.pop(context),
                              )
                            ]).show();
                      }
                    },
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blue, Colors.red]),
                    child: Center(
                      child: Text(
                        "ارسل رايك",
                        style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.orange,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ),
                  )
                ]).show();
          },
          icon: Icons.forum,
          title: "شاركنا رايك",
          context: context),

      Divider(),
      drawerCustum_widget(
          navigateingFunction: () {
            showPersonalCard(context);
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
