//       try {
//  _submitVolantiring.updateInfo(
//             volunteerPerson: currentUserName,
//             id: widget.requestPublisher);
//         Navigator.pop(context);
//         Alert(
//             context: context,
//             buttons: [
//               DialogButton(
//                   child: Text(
//                     "الانتقال للصفحه الرئيسيه",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 17,
//                       fontFamily:
//                           ArabicFonts.Tajawal,
//                       fontWeight:
//                           FontWeight.w700,
//                       package:
//                           'google_fonts_arabic',
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator
//                         .pushReplacementNamed(
//                             context,
//                             Home_Screen.id);
//                   })
//             ],
//             title: "شكرا لك",
//             desc:
//                 " شكرا لتطوعك, تاكد من تواصلك مع صاحب الطلب من خلال اي وسيله موجوده في البرنامج",
//             image: Image.asset(
//                 "assets/img/5de.gif"),
//             closeFunction: () =>
//                 Navigator.pushReplacementNamed(
//                     context, Home_Screen.id),
//             style: AlertStyle(
//               titleStyle: TextStyle(
//                 color: Colors.green,
//                 fontSize: 37,
//                 fontFamily:
//                     ArabicFonts.Aref_Ruqaa,
//                 fontWeight: FontWeight.w700,
//                 package: 'google_fonts_arabic',
//               ),
//               descStyle: TextStyle(
//                 color: Colors.green,
//                 fontSize: 15,
//                 fontFamily: ArabicFonts.Cairo,
//                 fontWeight: FontWeight.w700,
//                 package: 'google_fonts_arabic',
//               ),
//             )).show();
//       }on FormatException catch (e) {
//         print("object $e");
//       }

//  setState(() {
//                       disable = true;
//                     });
//                     print(_detailsController.text +
//                         '\n from RequestingScreen.dart \n' +
//                         _requestNameController.text);
//                     try {
//                       String validName =
//                           validateName(name: _requestNameController.text);
//                       var validDesc = _detailsController.text == null;
//                       if (validName != '' || validDesc == true) {
//                         setState(() {
//                           _visStatus = true;
//                           nameError = validName;
//                           detelisError = 'يجب عليك اضافة التفاصيل';
//                         });
//                       }
//                       if (dropDownValue == null) {
//                         setState(() {
//                           _visStatus = true;
//                           statusError = "يجب اختيار حالة الشخص";
//                         });
//                       }
//                       try {
//                         if (_image.existsSync() == true) {
//                           imgError = "";
//                         }
//                       } catch (e) {
//                         imgError = "يرجي اختيار صوره  ";
//                       }
//                       if (validName == '' &&
//                           validDesc == false &&
//                           dropDownValue != null &&
//                           imgError == '') {
//                             print("Valoddddddddd");
//                         await uploadFile();
//                         await _request_service.add_request(
//                           details: _detailsController.text,
//                           status: dropDownValue,
//                           title: _requestNameController.text,
//                           imgUrl: imgUrl,
//                         );
//                          return Alert(
//                       context: context,
//                       title: "تم اضافة طلبك بنجاح",
//                       desc: "شكرا لك علي استخدامك البرنامج,تم اضافة طلبك بنجاح",
//                       buttons: [
//                         DialogButton(
//                             child: Text(
//                               "انتقل للصفحه الرئيسيه",
//                               style: TextStyle(
//                                 fontFamily: ArabicFonts.Cairo,
//                                 package: 'google_fonts_arabic',
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.pop(context);
//                               Navigator.pushReplacementNamed(
//                                   context, Home_Screen.id);
//                             })
//                       ],
//                       style: AlertStyle(
//                           titleStyle: TextStyle(
//                               color: Colors.green,
//                               fontFamily: ArabicFonts.Tajawal,
//                               package: 'google_fonts_arabic',
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.w800),
//                           animationType: AnimationType.shrink,
//                           descStyle: TextStyle(
//                               color: Colors.orange[900],
//                               fontFamily: ArabicFonts.Cairo,
//                               package: 'google_fonts_arabic',
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.w600)),
//                       image: Image.asset(
//                         "assets/img/ok.png",
//                       ),
//                     ).show();
//                       }
//                     } catch (e) {
//                       print(e.toString());
//                     }

//////////////
///
//                      onTap: () {
//                               // What Will Happen Here Will Remaine Here
// /**
//  * First We make a new collection cALllaed compleated-Request
//  *
//  */
//                               Alert(
//                                 context: context,
//                                 type: AlertType.warning,
//                                 title: "هل انت متاكد؟",
//                                 desc:
//                                     " هل انت متاكد من انك تريد التطوع لهذا الطلب ,, لا يمكنك التراجع في قرارك!",
//                                 style: AlertStyle(
//                                   descStyle: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       package: 'google_fonts_arabic',
//                                       fontFamily: ArabicFonts.Tajawal),
//                                   titleStyle: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.red,
//                                       package: 'google_fonts_arabic',
//                                       fontFamily: ArabicFonts.Cairo),
//                                 ),
//                                 buttons: [
//                                   DialogButton(
//                                     child: Text(
//                                       "لا لست متاكد",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontFamily: ArabicFonts.Tajawal,
//                                         fontWeight: FontWeight.w600,
//                                         package: 'google_fonts_arabic',
//                                       ),
//                                     ),
//                                     onPressed: () => Navigator.pop(context),
//                                     color: Color.fromRGBO(0, 179, 134, 1.0),
//                                   ),
//                                   DialogButton(
//                                     child: Text(
//                                       "نعم ,انا متاكد",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 17,
//                                         fontFamily: ArabicFonts.Tajawal,
//                                         fontWeight: FontWeight.w700,
//                                         package: 'google_fonts_arabic',
//                                       ),
//                                     ),
//                                     onPressed: () {

//                                        SubmitVolantiring().updateInfo(
//                                           volunteerPerson: currentUserName,
//                                           id: widget.requestPublisher);

//                                                                      Navigator.pop(context);

//                                     }
