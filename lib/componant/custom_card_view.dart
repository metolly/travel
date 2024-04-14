import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/constant.dart';
import 'package:travel/screen/details_screen/details_screen.dart';

class CustomCardView extends StatelessWidget {
  CustomCardView(
      {Key? key,
      required this.image,
      required this.text1,
      required this.rating,
      required this.location,
      required this.latitute,
      required this.longtute,
      required this.prize,
      required this.description,

      })
      : super(key: key);
  final String image,
      text1,
      rating,
      location,
      latitute,
      longtute,
      prize,
      description
  ;
User? user =FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
           Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        image: image,
                        text1: text1,
                        rating: rating,
                        location: location,
                        latitute: latitute,
                        longtute: longtute,
                        prize: prize,
                        description: description,
                      )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 350,
          decoration: BoxDecoration(
            color: secondcolor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: NetworkImage (
                        image,
                      ),
                        fit: BoxFit.fill

                      )
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(text1),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text('$rating of 5'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(location),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
