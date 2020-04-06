import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:umruh_lgherak/Screens/request_screen.dart';

// import 'package:omra_legherk/screens/RequestingScree.dart';
BottomNavigationBar HomeBottomBar() {
  return BottomNavigationBar(
    selectedFontSize: 23,
    unselectedFontSize: 23,
    elevation: 0.0,
    backgroundColor: Colors.orange[50],
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.account_box,
            size: 0.0,
          ),
          title: Text(
            'لك وللناس',
            style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
            ),
          )),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.ac_unit,
          size: 0.0,
        ),
        title: Text(
          'اصنع الخير',
          style: TextStyle(
            color: Colors.blue,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
    ],
  );
}

/////////////////////
///Floating Action Button
FloatingActionButton HomeFAB(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Colors.grey,
    onPressed: () {
       Navigator.pushNamed(context, Request_Screen.id);
      // Navigator.push(
      // context, MaterialPageRoute(builder: (context) => Hello()));
    },
    tooltip: 'قدم طلبك الان',
    foregroundColor: Colors.orange[900],
    splashColor: Colors.orange[900],
    child: Icon(Icons.add_circle_outline),
  );
}
