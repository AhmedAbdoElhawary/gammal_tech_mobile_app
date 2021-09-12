import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/Firebase/firebase.dart';
import 'package:gammal_tech_mobile_app/common_ui/common-ui.dart';
import 'package:gammal_tech_mobile_app/the_pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
 enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}
class Provider_SignIn extends ChangeNotifier {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  late String zd='+20';
  late String verificationId="";
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String finalNumber = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  bool showLoading = false;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    showLoading = true;
    try {
      final authCredential =
      await auth.signInWithCredential(phoneAuthCredential);
      showLoading = false;
      notifyListeners();
      if (authCredential.user != null) {
        CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');
        QuerySnapshot querySnapshot = await _collectionRef.get();
        int i = 0;
        for (i = 0; i < querySnapshot.docs.length; i++) {
          if(user!.phoneNumber!=null)
            if (querySnapshot.docs[i]["phone"] == user!.phoneNumber) break;
          else if(i == querySnapshot.docs.length-1){
            FirestoreOperation().addDataFirestore(
              name: "",
              shirt: "",
              email: "",
              phone: user!.phoneNumber,
              gender: "",
              birthday: "",
              birthmonth: "",
              birthyear: "",
            );
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      showLoading = false;
      showToast(e.toString());
      notifyListeners();
    }
    notifyListeners();

  }

  verifyNumber() async {
    finalNumber = zd +phoneController.text;
    showLoading = true;
    await auth.verifyPhoneNumber(
      phoneNumber: finalNumber,
      verificationCompleted: (phoneAuthCredential) async {
        showLoading = false;
        notifyListeners();

      },
      verificationFailed: (verificationFailed) async {
        showLoading = false;
        showToast(verificationFailed.toString());
        notifyListeners();

      },
      codeSent: (verificationId, resendingToken) async {
        showLoading = false;
        currentState =
            MobileVerificationState.SHOW_OTP_FORM_STATE;
        verificationId = verificationId;
        notifyListeners();

      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );

    notifyListeners();

  }

  otpNumber(context) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance();
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode:otpController.text);
    signInWithPhoneAuthCredential(phoneAuthCredential);
    prefs.setBool("checkForAccount", true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false,
    );
    notifyListeners();
  }

}