import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  addDataFirestore({
    required String name,
    required String shirt,
    required String email,
    required var phone,
    required String gender,
    required String birthday,
    required String birthmonth,
    required String birthyear,
  }) {
    dbref
        .add({
          'name': name,
          "email": email,
          "phone": phone,
          'shirt': shirt,
          'gender': gender,
          'birthday': birthday,
          'birthmonth': birthmonth,
          'birthyear': birthyear,
        })
        .then((value) => print("User Updat ed"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  updateDataFirestore(
      {required String name,
      required String shirt,
      required String email,
      required var phone,
      required String gender,
      required String birthday,
      required String birthmonth,
      required String birthyear,
      required String id}) {
    dbref
        .doc(id)
        .update({
          'name': name,
          "email": email,
          "phone": phone,
          'shirt': shirt,
          'gender': gender,
          'birthday': birthday,
          'birthmonth': birthmonth,
          'birthyear': birthyear,
        })
        .then((value) => print(
            "************************************************************************************************************************************************************\n"
                "  User Updated "
                "\n***********************************************************************************************************************************************************"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  deleteDataFirestore(
      {required String id,
      required var model,
      required bool fromUpdate}) async {
    String filePath = model["image"].replaceAll(new RegExp(r'(\?alt).*'), '');

    List split = filePath.split("data%2F");

    FirebaseStorage.instance
        .ref("data")
        .child(split[1])
        .delete()
        .then((_) => print('Successfully deleted $filePath storage item'))
        .catchError((_) {
      print("image not exist in the firebase storage");
    });

    if (!fromUpdate) {
      dbref
          .doc(id)
          .delete()
          .then((value) => print("deleting successfully"))
          .catchError((e) => print("$e \nerror while deleting the element"));
      print(id);
    }
  }
}
