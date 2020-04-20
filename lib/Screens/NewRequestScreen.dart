import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:path/path.dart' as path;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:umruh_lgherak/Screens/home_screen.dart';
import 'package:umruh_lgherak/Services/new_request.dart';
import 'package:umruh_lgherak/Services/validate_regestration.dart';
import 'package:umruh_lgherak/Widgets/home/buildHor_list.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/customshape.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/responsive.dart';

class Request_Screen extends StatefulWidget {
  static String id = 'Request_Screen';
  @override
  _Request_ScreenState createState() => _Request_ScreenState();
}

class _Request_ScreenState extends State<Request_Screen> {
  File _image;
  var dropDownValue;
  String imgUrl = '';
  Future uploadFile() async {
    // // getImage();
    StorageReference storageReference =   FirebaseStorage.instance
        .ref()
        .child('requests_pic/${path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      imgUrl = fileURL;
      setState(() {
        imgUrl = fileURL;
        print("$imgUrl From setstate in request Screen");
      });
    });
  }

  Future getImage() async {
    return await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 500,
    ).then((img) {
      setState(() {
        _image = img;
      });
    });
  }

  TextEditingController _requestNameController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();
  Duration waitforalert = Duration(seconds: 5);
  Request_Service _request_service = Request_Service();
  bool visableStatus = false;
  String nameError = ' ', imgError = ' ', detelisError = "", statusError = " ";

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    var _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    var _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    var _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    bool disable = false;
    return ModalProgressHUD(
      inAsyncCall: disable,
      child: Scaffold(
        // key: _scaffoldKey,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: <Widget>[
              //

              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: CustomShapeClipper2(),
                  child: Container(
                    height: _large
                        ? _height / 12
                        : (_medium ? _height / 11 : _height / 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange[600], Colors.black],
                      ),
                    ),
                  ),
                ),
              ),

              //  First Widget In ListView

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "اضف طلب جديد",
                    style: TextStyle(
                      fontFamily: ArabicFonts.Aref_Ruqaa,
                      package: 'google_fonts_arabic',
                      fontSize: 35.0,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  await getImage();
                },
                child: Container(
                  height: _height / 5.5,
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
                  child: _image == null
                      ? Icon(
                          Icons.add_a_photo,
                          size: _large ? 40 : (_medium ? 33 : 31),
                          color: Colors.orange[200],
                        )
                      : new Container(
                          width: 120.0,
                          height: 190.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(_image),
                            ),
                          )),
                ),
              ),
              //
              Padding(padding: EdgeInsets.only(top: 19)),

              // Second Widget in ListView
              // Text('اسم الشخص الذي ترغب بعمل عمره له'),
              RequestNameController(
                  requestNameController: _requestNameController),
              Padding(padding: EdgeInsets.only(top: 19)),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: true,
                    alignLabelWithHint: true,
                    enabled: true,
                    filled: true,
                    focusColor: Colors.orange,
                    fillColor: Colors.amber[100],
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      // borderSide: BorderSide.,
                      borderRadius: BorderRadius.circular(30),
                      // borderSide: BorderSide.none
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.orange[900],
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontSize: 20.0,
                  ),
                  value: dropDownValue,
                  hint: Text("حالة الشخص"),
                  // isDense: true,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text("مريض"),
                      value: "مريض",
                    ),
                    DropdownMenuItem(
                      child: Text("متوفي"),
                      value: "متوفي",
                    )
                  ],
                  onChanged: (val) {
                    setState(() {
                      dropDownValue = val;
                      print(val);
                    });
                  }),
              Padding(padding: EdgeInsets.only(top: 15)),

              //////*
              DetelisSection(detailsController: _detailsController),
              Padding(padding: EdgeInsets.only(top: 10)),
              Visibility(
                visible: visableStatus,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        imgError,
                        style: errorStyle(),
                      ),
                      Text(
                        nameError,
                        style: errorStyle(),
                      ),
                      Text(
                        statusError,
                        style: errorStyle(),
                      ),
                      Text(
                        detelisError,
                        style: errorStyle(),
                      )
                    ],
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 10)),
              Material(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    String validName =
                        validateName(name: _requestNameController.text);
                    setState(() {
                      nameError = validName;
                      visableStatus = true;
                    });
                    //  var validDesc = _detailsController.text == null;
                    if (_detailsController.text == '') {
                      setState(() {
                        detelisError = 'تاكد من كتابتك تفاصيل الطلب';
                        visableStatus = true;
                      });
                    } else {
                      setState(() {
                        detelisError = '';
                        visableStatus = true;
                      });
                    }

                    if (dropDownValue == null) {
                      setState(() {
                        statusError = "يجب اختيار حالة الشخص";
                        visableStatus = true;
                      });
                    } else {
                      setState(() {
                        statusError = "";
                        visableStatus = true;
                      });
                    }

                    try {
                      if (_image.existsSync() == true) {
                        imgError = "";
                      }
                    } catch (e) {
                      imgError = "يرجي اختيار صوره  ";
                    }
//Validation Compleated
                    if (validName == '' &&
                        _detailsController.text != '' &&
                        dropDownValue != null &&
                        imgError == '') {
                      setState(() {
                        disable = true;
                      });
                      print("Valoddddddddd");
                      await uploadFile();
                      await _request_service.add_request(
                        details: _detailsController.text,
                        status: dropDownValue,
                        title: _requestNameController.text,
                        imgUrl: imgUrl,
                      );
                      setState(() {
                        disable = false;
                      });
                      return Alert(
                        context: context,
                        title: "تم اضافة طلبك بنجاح",
                        desc:
                            "شكرا لك علي استخدامك البرنامج,تم اضافة طلبك بنجاح",
                        buttons: [
                          DialogButton(
                              child: Text(
                                "انتقل للصفحه الرئيسيه",
                                style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(
                                    context, Home_Screen.id);
                              })
                        ],
                        style: AlertStyle(
                            titleStyle: TextStyle(
                                color: Colors.green,
                                fontFamily: ArabicFonts.Tajawal,
                                package: 'google_fonts_arabic',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800),
                            animationType: AnimationType.shrink,
                            descStyle: TextStyle(
                                color: Colors.orange[900],
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600)),
                        image: Image.asset(
                          "assets/img/ok.png",
                        ),
                      ).show();
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'اضف الان',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      fontFamily: ArabicFonts.Changa,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                ),
              ),

              Dismissible(
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'اذا حدثت اي مشكله خلال تقديم الطلب برجاء التواصل معنا',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.orange,
                          // backgroundColor: Colors.lightGreen,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w600,
                          fontFamily: ArabicFonts.El_Messiri,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ),
                  ),
                ),

                key: UniqueKey(),
                // direction: DismissDirection.startToEnd,
                // dragStartBehavior: DragStartBehavior.start,

                onDismissed: (dir) {
                  // setState(() {
                  //   list_name.removeAt(item);

                  // });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
