import 'package:flutter/material.dart';
import 'package:travel/constant.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10),
      child: CircleAvatar(
          backgroundColor: secondcolor,
          child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios,size: 15,),))),
    );
  }
}
