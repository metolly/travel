import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel/componant/custom_text_field.dart';
import 'package:travel/componant/defult_button.dart';
import 'package:travel/constant.dart';
import 'package:travel/screen/home_screen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen(
      {Key? key,
      required this.image,
      required this.username,
      required this.email,
      required this.phone})
      : super(key: key);
  final String? image;
  final String? username, email, phone;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? url;
  File? _imageFile;
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
    final storage = FirebaseStorage.instance;
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();

    await storage.ref().child('images/$imageName').putFile(_imageFile!);
    downloadURL =
        await storage.ref().child('images/$imageName').getDownloadURL();
  }

  dynamic? downloadURL;

  TextEditingController? username1 = TextEditingController();
  TextEditingController? email1 = TextEditingController();
  TextEditingController? phone1 = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    if (widget.username == null) {
      username1?.text = 'username';
    } else {
      username1?.text = widget.username!;
    }
    if (widget.email == null) {
      email1?.text = 'email';
    } else {
      email1?.text = widget.email!;
    }
    if (widget.phone == null) {
      phone1?.text = 'phone';
    } else {
      phone1?.text = widget.phone!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () async {
              await _pickImage(ImageSource.gallery);
            },
            child: CircleAvatar(
              radius: 70,
              child: _imageFile == null
                  ? (widget.image != null
                      ? Image.network(widget.image!)
                      : Container())
                  : Image.file(_imageFile!),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              text: 'username', icon: Icons.person, textEditingController: username1),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              text: 'phone', icon: Icons.phone, textEditingController: phone1),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DefultButton(
                text: 'Done',
                onTap: () async {
                  print(user?.uid);
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  });
                  if (downloadURL == null) {
                    await FirebaseFirestore.instance
                        .collection('user')
                        .doc(user?.uid)
                        .set({
                      'username': username1?.text,
                      'Email': email1?.text,
                      'phone': phone1?.text,
                      'image': widget.image,
                    });
                  } else {
                    await FirebaseFirestore.instance
                        .collection('user')
                        .doc(user?.uid)
                        .set({
                      'username': username1?.text,
                      'Email': email1?.text,
                      'phone': phone1?.text,
                      'image': downloadURL,
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
