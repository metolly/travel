import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:travel/screen/home_screen/componant/body.dart';
import 'package:travel/screen/log_in_screen/log_in_screen.dart';
import 'package:travel/screen/profile_screen.dart';
import 'package:travel/screen/user_booked/user_booked.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic>? data;

  Future<void> fetchData() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore
        .instance
        .collection('user')
        .doc(user?.uid)
        .get();
    data = documentSnapshot.data() as Map<String, dynamic>?;

  }
  @override
  void initState() {
      fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(
              Icons.settings,
              size: 35,
            ),
            onPressed: () async {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
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
      body: Body(),
      drawer: Drawer(
        width: 200,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(
                      image: data?['image'],
                      username: data?['username'],
                      email: data?['Email'],
                      phone: data?['phone'],
                  ),),);
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Log Out '),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LogIn()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
