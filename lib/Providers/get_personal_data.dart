import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/firebase.dart';

final List<String> listOfShirtSize = [
  "Select one...",
  "XS",
  "S",
  "M",
  "L",
  "XL",
  "XXL",
  "Overflow",
];
final List<String> listOfGender = [
  "Select one...",
  "Male",
  "Female",
];
var listOfDay = List<String>.generate(31, (i) => "${i + 1}");
var listOfMonth = List<String>.generate(12, (i) => "${i + 1}");
var listOfYear = List<String>.generate(67, (i) => "${1950 + i}");

class ProviderGetPersonalData extends ChangeNotifier {
  String dropdownValue1 = "Select one...";
  String dropdownValueShirtSize = 'Select one...';
  String dropdownValueGender = 'Select one...';
  String dropdownValueDay = '4';
  String dropdownValueMonth = '4';
  String dropdownValueYear = '2001';
  String phoneNumber = '';
  String theVideo = '';
  int lengthOfTheCourse = 0;
  List questions = [];
  List exercises = [];
  String videoId = "";
  String lessonName = "";
  String descriptionText = "";

  TextEditingController controlUserName = TextEditingController();
  TextEditingController controlUserEmail = TextEditingController();
  String id = '';
  final auth = FirebaseAuth.instance;
  personalData() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    int i = 0;
    for (i = 0; i < querySnapshot.docs.length && user != null; i++) {
      if (querySnapshot.docs[i]["phone"] == user!.phoneNumber) break;
    }
    var data = querySnapshot.docs[i];
    controlUserName.text = data.get("name");
    controlUserEmail.text = data.get("email");
    dropdownValueShirtSize =
        data.get("shirt") == "" ? 'Select one...' : data.get("shirt");
    dropdownValueGender =
        data.get("gender") == "" ? 'Select one...' : data.get("gender");
    dropdownValueDay = data.get("birthday") == "" ? '4' : data.get("birthday");
    dropdownValueMonth =
        data.get("birthmonth") == "" ? '4' : data.get("birthmonth");
    dropdownValueYear =
        data.get("birthyear") == "" ? '2000' : data.get("birthyear");
    phoneNumber = data.get("phone") == "" ? '' : data.get("phone");
    id = data.id;
  }

  getTheVideos(index) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('info');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    var data = querySnapshot.docs[index];
    theVideo = data.get("video");
  }

  getVideoLessonsData(String theCourse, int indexOfTheLesson) async {
    CollectionReference _collectionRef = FirebaseFirestore.instance
        .collection("video lessons")
        .doc(theCourse)
        .collection("lessons");
    QuerySnapshot querySnapshot = await _collectionRef.get();

    questions = querySnapshot.docs[indexOfTheLesson]["Questions"];
    exercises = querySnapshot.docs[indexOfTheLesson]["Exercises"];
    videoId = querySnapshot.docs[indexOfTheLesson]["video id"];
    lessonName = querySnapshot.docs[indexOfTheLesson]["lesson name"];
    descriptionText = querySnapshot.docs[indexOfTheLesson]["description name"];
  }

  Future<void> getLengthOfTheCourse(String theCourse) async {
    CollectionReference _collectionRef = FirebaseFirestore.instance
        .collection("video lessons")
        .doc(theCourse)
        .collection("lessons");
    QuerySnapshot querySnapshot = await _collectionRef.get();
    lengthOfTheCourse = querySnapshot.docs.length;
  }

  onChangedBirthDateDropList(
      {required String? newValue, required String value}) {
    value == dropdownValueDay
        ? dropdownValueDay = newValue!
        : (value == dropdownValueMonth
            ? dropdownValueMonth = newValue!
            : dropdownValueYear = newValue!);
    notifyListeners();
  }

  onChangedDropList({required String? newValue, required String value}) {
    value == dropdownValueShirtSize
        ? dropdownValueShirtSize = newValue!
        : dropdownValueGender = newValue!;
    notifyListeners();
  }

  onChange(String? newValue) {
    dropdownValue1 = newValue!;
    notifyListeners();
  }
}
