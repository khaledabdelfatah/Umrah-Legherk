import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SubmitVolantiring {
  updateInfo({String volunteerPerson, String id}) async {
    FirebaseUser user;
    FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser currentUser = await _auth.currentUser();
    // print(user.uid);
    try {
      CollectionReference usercollection =
          Firestore.instance.collection('requests');

      return await usercollection.document(id).updateData({
        'isCompleted': true,
        'volunteerPerson_name': volunteerPerson,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
