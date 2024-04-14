import 'package:flutter/material.dart';

class OnBoardContent1 extends StatelessWidget {
   OnBoardContent1({Key? key, required this.text1, required this.image, required this.text2}) : super(key: key);
final String text1 ;
final String text2 ;
final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height/2,
                width: double.infinity,
                child: Image.asset(image,fit: BoxFit.fill,)),
            Spacer(),

            Text(text1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
            Spacer(),
            Text(text2,style:TextStyle(fontSize: 15)),

          ],
        ),
      ),
    );


  }
}
