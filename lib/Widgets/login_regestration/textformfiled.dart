import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
// import 'package:login_signup/ui/widgets/responsive_ui.dart';
import './responsive.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  final String lableText;
  final int maline;
  CustomTextField({
    this.hint,
    this.maline = 1,
    this.lableText,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  double _width;

  double _pixelRatio;
  bool large;

  bool medium;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        minLines: 1,
        
        maxLines: widget.maline,
        obscureText: widget.obscureText,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          suffixIcon: Icon(widget.icon, color: Colors.orange[600], size: 20),
          hintText: widget.hint,
          // labelText: lableText,
           // errorBorder: ,
          
           errorMaxLines: 1,
            hasFloatingPlaceholder: true,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
              // textBaseline: TextBaseline.alphabetic,
              color: Colors.orange,
              inherit: true,
              fontSize: 20.0,
              decorationStyle: TextDecorationStyle.wavy),
          focusColor: Colors.orange[900],

          // isDense: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: ArabicFonts.Tajawal,
            package: 'google_fonts_arabic',
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
