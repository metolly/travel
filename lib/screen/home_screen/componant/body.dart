import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel/componant/custom_card_view.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Text('Explore the', style: TextStyle(fontSize: 25)),
          Row(
            children: [
              Text(
                'Beautiful',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                ' World!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 25),
              ),
            ],
          ),
          FutureBuilder(
              future: FirebaseFirestore.instance.collection('Travenor').get(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData == true) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return CustomCardView(
                        image: snapshot.data.docs[index]['image'],
                        text1: snapshot.data.docs[index]['place name'],
                        rating: snapshot.data.docs[index]['rating'],
                        location: "${snapshot.data.docs[index]['country']} ,${snapshot.data.docs[index]['city']}",
                        latitute: snapshot.data.docs[index]['latitude'],
                        longtute: snapshot.data.docs[index]['longtute'],
                        prize:  snapshot.data.docs[index]['prize'],
                        description: snapshot.data.docs[index]['description'],

                      );
                    },
                  );
                } else {
                  return Text('Loading');
                }
              }),

        ],
      ),
    );
  }
}
