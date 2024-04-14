import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/componant/custom_text_field.dart';
import 'package:travel/componant/defult_button.dart';
import 'package:travel/constant.dart';
import 'package:travel/screen/log_in_screen/log_in_screen.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 60,
        ),
        Text(
          'Sign up now',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Please fill the details and create account',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),

        CustomTextField(
            textEditingController: email,
            text: "Your Email",
            icon: Icons.person),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          textEditingController: password,
          text: "Password",
          icon: Icons.remove_red_eye_outlined,
        ),
        SizedBox(
          height: 30,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefultButton(
              onTap: () async {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text, password: password.text);

              },
              text: 'Sign Up'),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t Have an account?'),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Text(
                '  Sign In',
                style: TextStyle(fontSize: 15, color: primarycolor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
