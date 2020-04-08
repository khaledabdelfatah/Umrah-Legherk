import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetTopVolounters {
  String x;
  Future getData() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('users').getDocuments();
    return qn.documents;
  }

  Future get2Data() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('requests').getDocuments();
    return qn.documents;
  }

  FutureBuilder builder() {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("  Im Loading"),
            );
          } else {
            return ListView.builder(
                itemCount: snapShot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapShot.data[index].data['title']),
                  );
                });
          }
        });
  }
}
