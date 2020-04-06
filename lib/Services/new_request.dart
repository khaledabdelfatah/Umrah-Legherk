import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Request_Service {
  Future add_request(
      {String title, String status, String details, String imgUrl}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    print(formatted); // something like 2013-04-20
    final FirebaseUser user = await _auth.currentUser();
    // print(user.uid);
    print('from newResquest.dart' +
        '\n' +
        title +
        '\n' +
        details +
        '\n' +
        imgUrl);
    CollectionReference usercollection =
        Firestore.instance.collection('requests');
    return await usercollection.document(user.uid).setData({
      'title': title,
      'puplished_date': formatted,
      'person_status': status,
      'request_details': details,
      'Pic_url': imgUrl,
    });
  }
}
