import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/screen/home_screen/home_screen.dart';
import 'package:travel/screen/sign_up_screen/componant/body.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData)
          {
            return Home();
          }
          else
          {
            return Body();
          }
        },
      ),
    );
  }

}
