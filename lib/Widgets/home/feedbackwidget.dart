import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:umruh_lgherak/Screens/home_screen.dart';
import 'package:umruh_lgherak/Services/feedback.dart';
 feedBackWidget({BuildContext context}){
     double rate = 0.0;
  TextEditingController ratingController = TextEditingController();
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
          }