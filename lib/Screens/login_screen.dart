 
import 'package:flutter/material.dart';
// import '../Services/createUser.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:umruh_lgherak/Screens/home_screen.dart';
import 'package:umruh_lgherak/Services/auth_service.dart';
import 'package:umruh_lgherak/Services/validate_regestration.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/customshape.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/loginScreen_widget.dart';
import 'package:flutter/services.dart';
import 'package:umruh_lgherak/Widgets/login_regestration/responsive.dart';

class LoginScreen extends StatefulWidget {
  static final id = "login_screen";
  @override
  _Login_screenState createState() => _Login_screenState();
}

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final DataBaseService service=DataBaseService();
class _Login_screenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool _saving = false;
  TextEditingController _loginEmailController = TextEditingController();
  TextEditingController _loginPasswordController = TextEditingController();
  Animation animation, delayedanimation, muchdelayedAnimation;
  AnimationController animationController;
  @override
  void initState() {
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

  String emailError = '';
  String passwordError = '';
  // GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  x() {
    setState(() {
      _saving = false;
    });
  }

  bool visabilitybool = false;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
//
    animationController.forward();

    signinService _service = signinService();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return ModalProgressHUD(
            inAsyncCall: _saving,
            color: Colors.orange[50],
            dismissible: true,

            ///TODO :Rememper to change this to false
            child: Scaffold(
              // key: _scaffoldKey,
              body: Container(
                // color: Colors.white,

                height: _height, //take the full height
                width: _width, //take the full screen width
                padding: EdgeInsets.only(bottom: 5),

                child: SingleChildScrollView(
                  //to prevent overLoading
                  child: Column(
                    children: <Widget>[
                      clipShape(),
                      Transform(
                        transform: Matrix4.translationValues(
                            delayedanimation.value * _width, 0.0, 0.0),
                        child: welcomeTextRow(
                            height: _height,
                            width: _width,
                            large: _large,
                            medium: _medium),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            animation.value * _width, 0.0, 0.0),
                        child: signInTextRow(
                            height: _height,
                            width: _width,
                            large: _large,
                            medium: _medium),
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: _width / 12.0,
                                right: _width / 12.0,
                                top: _height / 15.0),
                            child: Form(
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    delayedanimation.value * _width, 0.0, 0.0),
                                child: Column(
                                  children: <Widget>[
                                    emailTextFormField(
                                        emailcont: _loginEmailController),
                                    SizedBox(height: _height / 40.0),
                                    passwordTextFormField(
                                        passwordController:
                                            _loginPasswordController),
                                    forgetPassTextRow(
                                        height: _height,
                                        width: _width,
                                        large: _large,
                                        medium: _medium),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Visibility(
                                        maintainSize: false,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        visible: visabilitybool,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                emailError,
                                                style: errorStyle(),
                                              ),
                                              Text(
                                                passwordError,
                                                style: errorStyle(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: _height / 25),
                      Transform(
                        transform: Matrix4.translationValues(
                            muchdelayedAnimation.value * _width, 0.0, 0.0),
                        child: loginButton(
                          height: _height,
                          width: _width,
                          large: _large,
                          medium: _medium,
                          context: context,
                          singIn_method: () async {
                            setState(() {
                              emailError = validateEmail(
                                  email: _loginEmailController.text);
                              passwordError = validatePassword(
                                  password: _loginPasswordController.text);

                              visabilitybool = true;
                              if (emailError == '' && passwordError == '') {
                                _saving = true;
                              }
                            });

                            // setState(() {
                            //   _saving=false;
                            // });
                            try {
                              await _service.singin(
                                  email: _loginEmailController.text.trim(),
                                  password: _loginPasswordController.text);

                              await Navigator.pushReplacementNamed(
                                  context, Home_Screen.id);
                            } on PlatformException catch (e) {
                              setState(() {
                                _saving = false;
                              });
                              switch (e.message) {
                                case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                                  setState(() {
                                    emailError =
                                        "عفوا,لا يوجد مستخدم لدينا بهذا البريد الالكتروني";
                                  });
                                  break;
                                case 'The password is invalid or the user does not have a password.':
                                  setState(() {
                                    passwordError = "الرقم السري غير صحيح";
                                  });
                                  break;
                                case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                                  setState(() {
                                    emailError =
                                        "هناك مشكله في الاتصال بالانترنت ,,تاكد من وجود اتصال مستقر لديك ";
                                  });
                                  break;
                                // ...
                                default:
                                  print(
                                      'Case ${e.message} is not yet implemented');
                              }
                            }
                          },
                        ),
                      ),
                      signUpTextRow(
                          height: _height,
                          width: _width,
                          large: _large,
                          medium: _medium,
                          context: context),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

// Draw Shapes On the Top Of the Screen
//  بص انا مش فاهم هو عمل ايه هنا والله انا خدتها كوبي واشتغلت
  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Color of Shape
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
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.black],
                ),
              ),
            ),
          ),
        ),
        //

        loginLogo_container(
            height: _height, width: _width, large: _large, medium: _medium),
      ],
    );
  }
}
