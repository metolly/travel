import 'package:flutter/material.dart';
import 'package:travel/google_map_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key,required this.image,
    required this.text1,
    required this.rating,
    required this.location,
    required this.latitute,
    required this.longtute,
    required this.prize,
    required this.description}) : super(key: key);
  final String image,
      text1,
      rating,
      location,
      latitute,
      longtute,
      prize,
      description;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              Text(
                location,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Text(rating),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                         "\$$prize/person",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'About Destination',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                description,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Location',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

              Container(
                width: double.infinity,
                height:450,
                child: MapPage(latitute: double.parse(latitute), longtute: double.parse(longtute),),

              ),
            ],
          ),
        ),
      ],
    );
  }
}
