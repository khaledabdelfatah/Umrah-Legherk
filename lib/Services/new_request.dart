import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Request_Service {
  Future add_request(
      {String title, String status, String details, String imgUrl}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    var now = new DateTime.now();
    print(
        "/*/*/*/**///*/*/*/***************////////////***************//////////*");
    var millisecond = now.millisecond.toString();
    print(now.millisecond);
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    print(formatted); // something like 2013-04-20
    final FirebaseUser user = await _auth.currentUser();
    ////
    _auth = FirebaseAuth.instance;
    String requestPuplisher;
    var docRef = Firestore.instance.collection('users').document(user.uid);
    await docRef.get().then((document) {
      requestPuplisher = document['name'];
    });

    ////
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

    return await usercollection
        .document(user.uid + millisecond + formatted)
        .setData({
      'title': title,
      'puplished_date': formatted,
      'person_status': status,
      'request_details': details,
      'isCompleted': false,
      'volunteerPerson_name': '',
      'Pic_url': imgUrl,
      'puplisher': requestPuplisher
    });
  }
}
