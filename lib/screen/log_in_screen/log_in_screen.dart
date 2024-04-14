import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/componant/back_arrow.dart';
import 'package:travel/screen/home_screen/home_screen.dart';
import 'package:travel/screen/log_in_screen/componant/body.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return Body();
          }
        },
       ),
    );
  }
}
