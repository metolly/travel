import 'package:flutter/material.dart';
import 'package:travel/constant.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key, required this.text, required this.icon, required this.textEditingController}) : super(key: key);
final String text;
final IconData icon ;
final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
          controller: textEditingController,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(icon),
          ),
          hintText: text,
          filled: true,
          fillColor: secondcolor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          contentPadding:
          EdgeInsets.only(left: 25, bottom: 20, top: 20, right: 25),
        ),
      ),
    );
  }
}
