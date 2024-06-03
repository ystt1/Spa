import 'package:flutter/material.dart';
import 'package:tbdd/Models/Service.dart';
import 'package:tbdd/until/color.dart';

class FeaturedServices extends StatelessWidget {
  final Service ser;
  const FeaturedServices({super.key,required this.ser});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      child: Column(children: [
        Image(
            image: NetworkImage(ser.imageUrl
            )),
        Text(
          ser.name,
          textAlign: TextAlign.start,
          style: TextStyle(color: color.colorWord, fontSize: 15),
        ),
      ]),
    );
  }
}
