import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel/screen/home_screen/home_screen.dart';
import 'package:travel/screen/log_in_screen/log_in_screen.dart';
import 'package:travel/screen/splash/splash_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
