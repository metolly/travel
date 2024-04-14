import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/componant/back_arrow.dart';
import 'package:travel/componant/defult_button.dart';
import 'package:travel/screen/details_screen/componant/body.dart';
import 'package:travel/screen/user_booked/user_booked.dart';

class DetailsScreen extends StatefulWidget {
   DetailsScreen(
      {Key? key,
      required this.image,
      required this.text1,
      required this.rating,
      required this.location,
      required this.latitute,
      required this.longtute,
      required this.prize,
      required this.description})
      : super(key: key);
  final String image,
      text1,
      rating,
      location,
      latitute,
      longtute,
      prize,
      description;
 late String id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final user =FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrow(),
        title: Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Booked()));
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 35,
              )),
        ],
      ),
      body: Body(
        image: widget.image,
        text1: widget.text1,
        rating: widget.rating,
        location: widget.location,
        latitute: widget.latitute,
        longtute: widget.longtute,
        prize: widget.prize,
        description: widget.description,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: DefultButton(
          onTap: (){
              FirebaseFirestore.instance.collection('user')
                  .doc(user.uid)
                  .collection('booked')
                  .add({
                'placename':widget.text1,
                'image': widget.image,
                'price': widget.prize,
                'rating': widget.rating,
                'location': widget.location,
              }).then((value) => widget.id =value.id);
              Navigator.pop(context);

          }, text: 'Book Now',

             // var darsh = FirebaseFirestore.instance.collection('user').doc(user.uid).collection('booked').doc(widget.id).id;
              //FirebaseFirestore.instance.collection('user')
                //  .doc(user.uid)
                 // .collection('booked').doc(darsh).delete();


        ),
      ),
    );
  }
}
