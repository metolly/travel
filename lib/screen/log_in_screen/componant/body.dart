import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel/componant/custom_text_field.dart';
import 'package:travel/componant/defult_button.dart';
import 'package:travel/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel/screen/home_screen/home_screen.dart';
import 'package:travel/screen/sign_up_screen/sign_up_screen.dart';
class Body extends StatelessWidget {
   Body({Key? key}) : super(key: key);
TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 60,
        ),
        Text(
          'Sign in now',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Please sign in to continue our app',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 60,
        ),
        CustomTextField(
            textEditingController: email,
            text: "Your Email", icon: Icons.person),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          textEditingController: password,
          text: "Password",
          icon: Icons.remove_red_eye_outlined,
        ),
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefultButton(onTap: signIn,text: 'Sign In'),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t Have an account?'),
            TextButton(
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
    },
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
              },child: Text("Sign UP",style: TextStyle(fontSize: 15, color: primarycolor),),
              ),
            ),
            
          ],
        ),

      ],
    );

  }
  Future signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);

  }
}
