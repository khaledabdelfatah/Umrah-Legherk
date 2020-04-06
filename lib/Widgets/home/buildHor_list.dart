import 'package:flutter/material.dart';
import '../login_regestration/textformfiled.dart';

buildList(
    {String name = '',
    ImageProvider imgPath,
    int numberofVol,
    Color bgColor,
    Color textColor,
    double cheight}) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0),
    child: GestureDetector(
      child: Container(
        height: 175,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: bgColor),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                height: 75.0,
                width: 75.0,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    height: cheight / 5.5,
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
                            image: imgPath,
                          ),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 17, color: textColor),
            ),
            Text(
              '$numberofVol',
              style: TextStyle(fontSize: 17, color: textColor),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget DetelisSection({TextEditingController detailsController}) {
  return CustomTextField(
    keyboardType: TextInputType.text,
    hint: 'اضف اي تفاصيل تحتاج لذكرها',
    icon: Icons.details,
    lableText: '',
    textEditingController: detailsController,
    maline: 3,
  );
}

Widget RequestNameController({TextEditingController requestNameController}) {
  return CustomTextField(
    hint: 'الاسم',
    keyboardType: TextInputType.text,
    icon: Icons.person_outline,
    textEditingController: requestNameController,
    obscureText: false,
  );
}
