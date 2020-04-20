import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedbackService {
  submitFeedback({String textFeedback = ' ', double rate = 0.0}) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      var customString;
      final FirebaseUser user = await _auth.currentUser();
      // print(user.uid);

      CollectionReference usercollection =
          Firestore.instance.collection('feedback');
      if (rate == 0.0) {
        customString = "User Didnt provide rating with emojy";
      } else if (rate == 1.0) {
        customString = " Very Very Bad";
      } else if (rate == 2.0) {
        customString = " Not Satisfied";
      } else if (rate == 3.0) {
        customString = " good";
      } else if (rate == 4.0) {
        customString = " good and satisfied";
      } else if (rate == 5.0) {
        customString = "Very Very Good,Well done";
      } else {
        customString = "ERRRRRRRRRRRROr";
      }

      print("we will submit");
      return await usercollection
          .document(user.uid + DateTime.now().toString())
          .setData({'feedback': textFeedback, 'rate': customString});
    } catch (e) {
      print(e.toString() + "From Feedback.dart");
    }
  }
}
