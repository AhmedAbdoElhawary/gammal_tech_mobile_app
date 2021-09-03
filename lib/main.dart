import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // TextEditingController otpCode = TextEditingController();
  //
  // bool isLoading = false;
  //
  // String? verificationid;
  //
  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: "+201094403139",
  //       timeout: const Duration(seconds: 20),
  //       verificationCompleted: (PhoneAuthCredential authCredential) async {
  //         print("verification completed ${authCredential.smsCode}");
  //         User? user = FirebaseAuth.instance.currentUser;
  //         otpCode.text = authCredential.smsCode!;
  //         if (authCredential.smsCode != null) {
  //           try{
  //             UserCredential credential =
  //             await user!.linkWithCredential(authCredential);
  //           }on FirebaseAuthException catch(e){
  //             if(e.code == 'provider-already-linked'){
  //               await _auth.signInWithCredential(authCredential);
  //             }
  //           }
  //           isLoading = false;
  //         }
  //       },
  //       verificationFailed: (FirebaseAuthException exception) {
  //         if (exception.code == 'invalid-phone-number') {
  //           print("The phone number entered is invalid!");
  //         }
  //       },
  //       codeSent: (String verificationId, int? forceResendingToken) {
  //         verificationid = verificationId;
  //         print(forceResendingToken);
  //         print("code sent");
  //       }
  //       ,
  //       codeAutoRetrievalTimeout: (String timeout) {
  //         return null;
  //       });


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gammal Tech',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 6),
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}