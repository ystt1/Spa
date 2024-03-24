import 'package:flutter/material.dart';
import 'package:tbdd/Widget/widget_support.dart';

class PageIntroduce1 extends StatelessWidget {
  const PageIntroduce1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color(int.parse('6EF8A8FF', radix: 16))])),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:30),
            child: Image.asset('images/lamdep.png'),
          ),
          Text(
            "Làm đẹp",
            style: AppWidget.highlightTextStyle(),
          )
        ],
      ),
    );
  }
}
