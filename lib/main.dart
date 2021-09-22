import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/Providers/get_personal_data.dart';
import 'package:gammal_tech_mobile_app/Providers/get_videos_form_firestore.dart';
import 'package:gammal_tech_mobile_app/Providers/home_page.dart';
import 'package:gammal_tech_mobile_app/Providers/send_email.dart';
import 'package:gammal_tech_mobile_app/Providers/sign_in_page.dart';
import 'package:gammal_tech_mobile_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool checkData = prefs.getBool("checkForAccount") == true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => Provider_animationOfButtons_HomePage()),
        ChangeNotifierProvider(create: (_) => Provider_SignIn()),
        ChangeNotifierProvider(create: (_) => Provider_GetPersonalData()),
        ChangeNotifierProvider(
            create: (_) => Provider_GetTheVideosFromFirestore()),
        ChangeNotifierProvider(create: (_) => Provider_SendEmail()),
      ],
      child: MyApp(checkData),
    ),
  );
}

class MyApp extends StatelessWidget {
  bool checkData;
  MyApp(
    this.checkData, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<Provider_GetPersonalData>(context, listen: false)
        .getVideoLessonsData("c", 0);
    if (checkData) {
      Provider.of<Provider_GetPersonalData>(context, listen: false)
          .personalData();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gammal Tech',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white, elevation: 6),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
