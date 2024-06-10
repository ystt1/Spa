import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/Models/Service.dart';
import 'package:tbdd/until/color.dart';

class FeaturedServices extends StatelessWidget {
  final Service ser;
  const FeaturedServices({super.key,required this.ser});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        context.pushNamed("serviceDetail",extra:{"service":ser});
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        child: Column(children: [
          Image(
              image: NetworkImage(ser.imgUrl),width:MediaQuery.of(context).size.width ,height: 70 ,fit: BoxFit.cover,),
          Text(
            ser.name,
            textAlign: TextAlign.start,
            style: TextStyle(color: color.colorWord, fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
