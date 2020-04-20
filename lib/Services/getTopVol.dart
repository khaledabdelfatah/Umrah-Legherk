import 'package:cloud_firestore/cloud_firestore.dart';

class GetTopVolounters {
  String x;
  Future getTopVoluntersData() async {
    var firestore = Firestore.instance;
    var qn = await firestore
        .collection('users')
        .where('number_ofVolunteering', isGreaterThanOrEqualTo: 1)
        .getDocuments();
    return qn.documents;
  }

  Future getUncomplettedRequest() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('requests')
        .where('isCompleted', isEqualTo: false)
        .getDocuments();
    return qn.documents;
  }

  Future getCompletedRequest() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('requests')
        .where('isCompleted', isEqualTo: true)
        .getDocuments();
    return qn.documents;
  }

  // FutureBuilder builder() {
  //   return FutureBuilder(
  //       future: getData(),
  //       builder: (context, snapShot) {
  //         if (snapShot.connectionState == ConnectionState.waiting) {
  //           return Center(
  //             child: Text("  Im Loading"),
  //           );
  //         } else {
  //           return ListView.builder(
  //               itemCount: snapShot.data.length,
  //               itemBuilder: (context, index) {
  //                 return ListTile(
  //                   title: Text(snapShot.data[index].data['title']),
  //                 );
  //               });
  //         }
  //       });
  // }
}
