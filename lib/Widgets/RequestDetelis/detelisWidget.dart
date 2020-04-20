import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';


launchPhoneNumber(
  {BuildContext context,String pnumber}
)async{
         var url = "tel:${pnumber}";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            var alertStyle = AlertStyle(
                              animationType: AnimationType.fromTop,
                              isCloseButton: false,
                              isOverlayTapDismiss: false,
                              descStyle: TextStyle(fontWeight: FontWeight.bold),
                              animationDuration: Duration(milliseconds: 400),
                              alertBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                side: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              titleStyle: TextStyle(
                                color: Colors.red,
                              ),
                            );
                            Alert(
                              context: context,
                              style: alertStyle,
                              type: AlertType.warning,
                              title: "حدث خطا اثناء الاتصال",
                              desc:
                                  "عفوا ,,حث حظا اثناء محاولة الاتصال رجاء اعد المحاوله",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "الرجوع للصفحه السابقه",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                  radius: BorderRadius.circular(0.0),
                                ),
                              ],
                            ).show();
                          }
}


//////////
launchWhatsapp({BuildContext context,String phNumber})async{
   var alertStyle = AlertStyle(
                            animationType: AnimationType.fromTop,
                            isCloseButton: false,
                            isOverlayTapDismiss: false,
                            descStyle: TextStyle(fontWeight: FontWeight.bold),
                            animationDuration: Duration(milliseconds: 400),
                            alertBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            titleStyle: TextStyle(
                              color: Colors.red,
                            ),
                          );
                          var whatsappUrl =
                              "whatsapp://send?phone=${phNumber}";
                          await canLaunch(whatsappUrl)
                              ? launch(whatsappUrl)
                              : Alert(
                                  context: context,
                                  style: alertStyle,
                                  type: AlertType.warning,
                                  title: "هاتفك لا يحتوي علي تطبيق واتساب",
                                  desc:
                                      "حتي تتمكن من استخدام هذه الخاصيه يجب ان يكون تطبيق واتساب مثبت لديك بالفعل",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "الرجوع للصفحه السابقه",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      color: Color.fromRGBO(0, 179, 134, 1.0),
                                      radius: BorderRadius.circular(0.0),
                                    ),
                                  ],
                                ).show();
}