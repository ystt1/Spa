import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tbdd/until/color.dart';

class ContacsUs extends StatelessWidget {
  const ContacsUs({super.key});

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
              BoxIcon(FontAwesomeIcons.globe, context),
              BoxIcon(FontAwesomeIcons.tiktok, context),
              BoxIcon(FontAwesomeIcons.youtube, context),
              BoxIcon(FontAwesomeIcons.facebook, context),
              BoxIcon(FontAwesomeIcons.instagram, context),
              BoxIcon(FontAwesomeIcons.facebookMessenger, context),
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_in_talk_sharp,
                    size: 16,
                    color: Colors.white,
                  ),
                  Text(
                    " Hotline 0123456",
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
