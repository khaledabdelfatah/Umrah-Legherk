import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts_arabic/fonts.dart';

//TODO
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:umruh_lgherak/Screens/hello_screen.dart';
import 'package:umruh_lgherak/Services/auth_service.dart';
import 'package:umruh_lgherak/Services/validate_regestration.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/customshape.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/regestration_widget.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/responsive.dart';

class Regestration_Screen extends StatefulWidget {
  static final id = "regesration_page";
  @override
  _Regestration_ScreenState createState() => _Regestration_ScreenState();
}

class _Regestration_ScreenState extends State<Regestration_Screen>
    with SingleTickerProviderStateMixin {
  File _image;
  String imgUrl;
  bool _saving = false;
  Animation animation, delayedanimation, muchdelayedAnimation;
  AnimationController animationController;
  bool checkBoxVal = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController _nameControll = TextEditingController();
  TextEditingController _emailControll = TextEditingController();
  TextEditingController _phoneNum = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
//

  bool isemailValid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedanimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchdelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.8, 1.0, curve: Curves.fastOutSlowIn)));
  }

  Future getImage() async {
    return await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 250,
      maxWidth: 250,
    ).then((img) {
      setState(() {
        _image = img;
      });
    });
  }

  Future uploadFile() async {
    // getImage();
    StorageReference storageReference = await FirebaseStorage.instance
        .ref()
        .child('profile_pic/${path.basename(_image.path)}}');
    StorageUploadTask uploadTask = await storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      imgUrl = fileURL;
      setState(() {
        imgUrl = fileURL;
        print("$imgUrl From setstate");
      });
    });
    String filename = path.basename(_image.path);
    StorageReference firebaseStorageref =
        FirebaseStorage.instance.ref().child(filename);
    try {
      String imgUrlorg = await (firebaseStorageref.getDownloadURL());
      imgUrl = imgUrlorg;
      setState(() {
        imgUrl = imgUrlorg;
        print('FILE UPLOODED SUSSESfully+$imgUrl');
      });
    } catch (e) {
      print('FUCK YOU' + e.toString());
    }
  }

  signinService _service = signinService();
  String nameError = '';
  String passwordError = ' ';
  String emailError = ' ';
  String phoneError = ' ';
  String rePasswordError = ' ';
  String imageError = ' ';

  String acceptBoxError = ' ';
  bool visabilityBool = false;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    animationController.forward();

//
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return ModalProgressHUD(
            color: Colors.orange[50],
            dismissible: false,
            progressIndicator: CircularProgressIndicator(
              semanticsLabel: 'Loading',
              semanticsValue: 'HELLo',
              backgroundColor: Colors.orange,
            ),
            inAsyncCall: _saving,
            child: Scaffold(
              body: SafeArea(
                top: false,
                child: Scaffold(
                  body: Container(
                    height: _height,
                    width: _width,
                    margin: EdgeInsets.only(bottom: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0, _height / 25, 0, 0)),
                          clipShape(),
                          Transform(
                              transform: Matrix4.translationValues(
                                  delayedanimation.value * _width, 0.0, 0.0),
                              child: form()),
                          acceptTermsTextRow(
                              checkBoxValue: checkBoxVal,
                              checkifisAccepted: (val) {
                                setState(() {
                                  checkBoxVal = val;
                                });
                              },
                              height: _height,
                              large: _large,
                              medium: _medium),
                          SizedBox(
                            height: _height / 36,
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                muchdelayedAnimation.value * _width, 0.0, 0.0),
                            child: Column(
                              children: <Widget>[
                                Visibility(
                                  maintainSize: false,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: visabilityBool,
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(imageError, style: errorStyle()),
                                        Text(nameError,
                                            textAlign: TextAlign.right,
                                            style: errorStyle()),
                                        Text(emailError, style: errorStyle()),
                                        Text(phoneError, style: errorStyle()),
                                        Text(passwordError,
                                            style: errorStyle()),
                                        Text(rePasswordError,
                                            style: errorStyle()),
                                        Text(acceptBoxError,
                                            style: errorStyle()),
                                      ],
                                    ),
                                  ),
                                ),
                                creatingAccountButton(
                                    creatingAccount: () async {
                                      setState(() {
                                        emailError = validateEmail(
                                            email: _emailControll.text);
                                        nameError = validateName(
                                            name: _nameControll.text);
                                        phoneError = validtePhoneNumber(
                                            phoneNumber: _phoneNum.text);
                                        passwordError = validatePassword(
                                            password: _passwordController.text);
                                        rePasswordError = validateRePassword(
                                            pass1: _passwordController.text,
                                            rePass: _rePasswordController.text);
                                        acceptBoxError =
                                            cheakBoxValidate(val: checkBoxVal);
                                        try {
                                          if (_image.existsSync() == true) {
                                            imageError = "";
                                          }
                                        } catch (e) {
                                          imageError =
                                              "يرجي اختيار صوره الشخصيه";
                                        }
                                        visabilityBool = true;
                                      });
                                      if (emailError == '' &&
                                          nameError == "" &&
                                          phoneError == '' &&
                                          passwordError == '' &&
                                          rePasswordError == '' &&
                                          acceptBoxError == '' &&
                                          imageError == '') {
                                        setState(() {
                                          _saving = true;
                                        });

                                        try {
                                          await _service.handleCreatingAccount(
                                              email: _emailControll.text.trim(),
                                              context: context,
                                              password:
                                                  _passwordController.text);
                                          await uploadFile().then((x) async {
                                            await _service.RegisterData(
                                              email: _emailControll.text.trim(),
                                              name: _nameControll.text,
                                              phoneNum: getcurrentCode() +
                                                  _phoneNum.text,
                                              imgLink: imgUrl,
                                            );
                                          });
                                          print('$imgUrl FROM REGESTRATION');
                                          await _service.RegisterData(
                                            email: _emailControll.text.trim(),
                                            name: _nameControll.text,
                                            phoneNum: getcurrentCode() +
                                                _phoneNum.text,
                                            imgLink: imgUrl,
                                          );
                                          await Navigator.pushReplacementNamed(
                                              context, Hello_Screen.id);

                                          print("FINALLLL");
                                        } on PlatformException catch (e) {
                                          /////
                                          print("""
                                     $e ,
                                     ${e.message}
                                     
                                     """);
                                          setState(() {
                                            _saving = false;
                                          });
                                          if (e.code ==
                                              'ERROR_EMAIL_ALREADY_IN_USE') {
                                            setState(() {
                                              emailError =
                                                  "هذا البريد الالكتروني مسجل لدينا بالفعل";
                                            });
                                          } else {
                                            setState(() {
                                              emailError = e.code;
                                            });
                                          }
                                          ////
                                        }
                                      }
                                    },
                                    large: _large,
                                    medium: _medium,
                                    width: _width),
                              ],
                            ),
                          ),
                          // infoTextRow(),
                          signInTextRow(height: _height, context: context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey[200], Colors.grey],
                ),
              ),
            ),
          ),
        ),
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
        GestureDetector(
          onTap: () async {
            await getImage();
          },
          child: Transform(
            transform:
                Matrix4.translationValues(animation.value * _width, 0.0, 0.0),
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
                  ? Hero(
                    tag: "mylogotag",
                                      child: Icon(
                        Icons.add_a_photo,
                        size: _large ? 40 : (_medium ? 33 : 31),
                        color: Colors.orange[200],
                      ),
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
        ),
        Positioned(
          top: _height / 8,
          left: _width / 1.75,
          child: Container(
            alignment: Alignment.center,
            height: _height / 23,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange[100],
            ),
            child: Icon(
              Icons.add_a_photo,
              size: _large ? 22 : (_medium ? 15 : 13),
            ),
          ),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            fullNameTextFormField(fullNameController: _nameControll),
            SizedBox(height: _height / 60.0),
            SizedBox(height: _height / 60.0),
            emailTextFormField(emailController: _emailControll),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(
              phoneController: _phoneNum,
            ),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(passController: _passwordController),
            SizedBox(height: _height / 60.0),
            repassword(rePassController: _rePasswordController),
          ],
        ),
      ),
    );
  }
}
