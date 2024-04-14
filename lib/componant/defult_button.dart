import 'package:flutter/material.dart';
import 'package:travel/constant.dart';

class DefultButton extends StatelessWidget {
  DefultButton({Key? key, required this.text, required this.onTap}) : super(key: key);
final String text;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primarycolor,
        ),
        child:Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),

      ),
    );
  }
}
