import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/componant/custom_card_view.dart';
import 'package:travel/componant/defult_button.dart';
import 'package:travel/constant.dart';

class BodyBook extends StatefulWidget {
  BodyBook(
      {Key? key,
      required this.image,
      required this.text1,
      required this.rating,
      required this.location,
        required this.id, required this.placename
      })
      : super(key: key);
  final String image, text1, rating, location,id,placename;

  @override
  State<BodyBook> createState() => _BodyBookState();
}

class _BodyBookState extends State<BodyBook> {
  var auth =FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
                  },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 425,
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
                      image: DecorationImage(image: NetworkImage( widget.image,),fit: BoxFit.fill),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(widget.placename,style: TextStyle(fontSize: 15),),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("${widget.rating} of 5"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(widget.location),

                        ],
                      ),

                      Text("\$${widget.text1}\\person"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefultButton(text: 'cancel', onTap: (){

                      var darsh = FirebaseFirestore.instance.collection('user').doc(auth.uid).collection('booked').doc(widget.id).id;
                      FirebaseFirestore.instance.collection('user')
                          .doc(auth.uid)
                          .collection('booked').doc(darsh).delete();
                      setState(() {

                      });
                    }),
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
