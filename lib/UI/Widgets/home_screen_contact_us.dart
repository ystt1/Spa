import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tbdd/until/color.dart';
import 'package:url_launcher/url_launcher.dart';

class ContacsUs extends StatefulWidget {
  const ContacsUs({super.key});

  @override
  State<ContacsUs> createState() => _ContacsUsState();
}

class _ContacsUsState extends State<ContacsUs> {


  late String website = '';
  late String titok = '';
  late String youtube = '';
  late String facebook = '';
  late String insta = '';
  late String mess = '';
  late String phone = '';

  @override
  void initState() {
    super.initState();
    fetchContactData(); // Gọi phương thức để lấy dữ liệu
  }

  Future<void> fetchContactData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Contact').get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = querySnapshot.docs.first;
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          facebook = data["facebook"];
          titok = data['tiktok'];
          youtube = data['youtube'];
          website = data['website'];
          insta = data['instagram'];
          mess = data['messenger'];
          phone = data['phoneNumber'];
        });
      }
    } catch (e) {
      print("Error fetching contact data: $e");
    }
  }

  Widget BoxIcon(IconData icon, BuildContext context) {
    return Card(
      elevation: 7,
      shadowColor: Colors.black26,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5),
          color: color.colorPrimary,
        ),
        width: MediaQuery.of(context).size.width / 8,
        height: 30,
        child: Icon(
          icon,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Column(
        children: [
          Text(
            "Về chúng tôi",
            style: TextStyle(color: color.colorWord),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
              onTap:() {launchUrl(Uri.parse(website));},
                  child: BoxIcon(FontAwesomeIcons.globe, context)),
              GestureDetector(
                  onTap:() {launchUrl(Uri.parse(titok));},
                  child: BoxIcon(FontAwesomeIcons.tiktok, context)),
              GestureDetector(
                  onTap:() {launchUrl(Uri.parse(youtube));},
                  child: BoxIcon(FontAwesomeIcons.youtube, context)),
              GestureDetector(
                  onTap:() {launchUrl(Uri.parse(facebook));},
                  child: BoxIcon(FontAwesomeIcons.facebook, context)),
              GestureDetector(
                  onTap:() {launchUrl(Uri.parse(insta));},
                  child: BoxIcon(FontAwesomeIcons.instagram, context)),
              GestureDetector(
                  onTap:() {launchUrl(Uri.parse(mess));},
                  child: BoxIcon(FontAwesomeIcons.facebookMessenger, context)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 7,
            shadowColor: Colors.black26,
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: color.colorPrimary,
                borderRadius: BorderRadius.circular(2.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_in_talk_sharp,
                    size: 16,
                    color: Colors.white,
                  ),
                  Text(
                    " Hotline $phone",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
