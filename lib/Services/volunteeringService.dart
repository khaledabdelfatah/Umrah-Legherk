import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SubmitVolantiring {
  updateInfo({String volunteerPerson, String id}) async {
    FirebaseUser user;
    FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser currentUser = await _auth.currentUser();
    // print(user.uid);
    try {
      CollectionReference requestCollections =
          Firestore.instance.collection('requests');

        await requestCollections.document(id).updateData({
        'isCompleted': true,
        'volunteerPerson_name': volunteerPerson,
      });
    } catch (e) {
      print(e.toString());
    }
    try{
      int volNumbers;
      CollectionReference usercollection =
          Firestore.instance.collection('users');
            await usercollection.document(currentUser.uid).get().then((doc){
volNumbers=doc['number_ofVolunteering'];
          });   
       return await usercollection.document(currentUser.uid).updateData({
            'number_ofVolunteering': volNumbers+1,
          });
    }catch(e){
      print(e.toString());
    }
       
  }
}
