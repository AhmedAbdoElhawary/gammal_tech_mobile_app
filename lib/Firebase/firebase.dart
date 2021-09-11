import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';

class FirestoreOperation {
  var dbref = FirebaseFirestore.instance.collection('users');

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');
  late var data;
  Future<dynamic> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    int i = 0;
    for (i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]["phone"] == user!.phoneNumber) {
        break;
      }
    }
    data = querySnapshot.docs[i].data();
    return querySnapshot.docs[i].data();
  }
}
