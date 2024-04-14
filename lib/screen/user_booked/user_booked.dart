import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/componant/back_arrow.dart';
import 'package:travel/componant/custom_card_view.dart';
import 'package:travel/constant.dart';
import 'package:travel/screen/user_booked/componant/body.dart';

class Booked extends StatelessWidget {
  Booked({Key? key}) : super(key: key);
  var auth = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrow(),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('user')
              .doc(auth.uid)
              .collection('booked')
              .get(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData == true) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return BodyBook(
                      placename:snapshot.data.docs[index]['placename'],
                      image: snapshot.data.docs[index]['image'],
                      text1: snapshot.data.docs[index]['price'],
                      rating: snapshot.data.docs[index]['rating'],
                      location: snapshot.data.docs[index]['location'], id: snapshot.data.docs[index].id,
                  );
                },
              );
            } else {
              return Text('Loading');
            }
          }),
    );
  }
}
