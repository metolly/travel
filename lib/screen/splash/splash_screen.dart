import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:travel/constant.dart';
import 'package:travel/screen/onboard/on_board_1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: primarycolor,
      splash: Image.asset('assets/images/5.png'),

      nextScreen: OnBoardScreen1(),
        duration: 1500,
    );
  }
}
