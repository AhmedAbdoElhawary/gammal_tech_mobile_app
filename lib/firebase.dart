import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/UI.dart';

User? user = FirebaseAuth.instance.currentUser;

class FirestoreOperation {
  var db = FirebaseFirestore.instance.collection('users');

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
    db
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
        .then((value) => showToast("user added $value"))
        .catchError((error) => showToast("Failed to update user: $error"));
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
    db
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
        .then((value) => showToast("user updates"))
        .catchError((error) => showToast("Failed to update user: $error"));
  }

  deleteDataFirestore(
      {required String id,
      required var model,
      required bool fromUpdate}) async {
    String filePath = model["image"].replaceAll(RegExp(r'(\?alt).*'), '');

    List split = filePath.split("data%2F");

    FirebaseStorage.instance
        .ref("data")
        .child(split[1])
        .delete()
        .then((_) => showToast('Successfully deleted $filePath storage item'))
        .catchError((_) {
      showToast("image not exist in the firebase storage");
    });

    if (!fromUpdate) {
      db
          .doc(id)
          .delete()
          .then((value) => showToast("deleting successfully"))
          .catchError(
              (e) => showToast("$e \nerror while deleting the element"));
      showToast(id);
    }
  }
}
