import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/provider_classes/provider_get_personal_data.dart';
import 'package:gammal_tech_mobile_app/provider_classes/provider_get_videos_form_firestore.dart';
import 'package:gammal_tech_mobile_app/provider_classes/provider_home_page.dart';
import 'package:gammal_tech_mobile_app/provider_classes/provider_send_email.dart';
import 'package:gammal_tech_mobile_app/provider_classes/provider_sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:gammal_tech_mobile_app/the_pages/home_page.dart';
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
        ChangeNotifierProvider(create: (_) => Provider_GetTheVideosFromFirestore()),
        ChangeNotifierProvider(create: (_) => Provider_SendEmail()),

      ],
      child: new MyApp(checkData),
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
    Provider.of<Provider_GetPersonalData>(context, listen: false).getVideoLessonsData("c",0);
    if (checkData)
      Provider.of<Provider_GetPersonalData>(context, listen: false)
          .personalData();
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
