import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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