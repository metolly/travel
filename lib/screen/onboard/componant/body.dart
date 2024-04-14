import 'package:flutter/material.dart';
import 'package:travel/componant/defult_button.dart';
import 'package:travel/constant.dart';
import 'package:travel/screen/log_in_screen/log_in_screen.dart';
import 'package:travel/screen/onboard/componant/on_board_1_content.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> spalshdata = [
    {
      "text1": "Life is short and the world is wide",
      "text2": "At Friends tours and travel, we customize\nreliable and trutworthy educational tours to\ndestinations all over the world",
      "image": "assets/images/afbea499038243 1.png"
    },
    {
      "text1": "It’s a big world out there go explore",
          "text2":"To get the best of your adventure you just\nneed to leave and go where you like. we are\nwaiting for you",
      "image": "assets/images/2.png"
    },
    {
      "text1": "People don’t take trips, trips take people",
      "text2":
          "To get the best of your adventure you just\nneed to leave and go where you like. we are\nwaiting for you",
      "image": "assets/images/3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: spalshdata.length,
              itemBuilder: (context, index) {
                return OnBoardContent1(
                    text1: spalshdata[index]['text1']!,
                    image: spalshdata[index]['image']!,
                    text2: spalshdata[index]['text2']!);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20),
              child: Column(
                children: [
                  Spacer(flex: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      spalshdata.length,
                      (index) => BuildDot(index: index),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  DefultButton(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                  }
                  ,text: "Skip",),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer BuildDot({int? index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primarycolor : secondcolor,
        borderRadius: BorderRadius.circular(3),
      ),
      duration: Duration(milliseconds: 200),
    );
  }
}
