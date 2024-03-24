import 'package:flutter/material.dart';
import 'package:tbdd/Widget/widget_support.dart';

class PageIntroduce2 extends StatelessWidget {
  const PageIntroduce2({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Colors.white, Color(int.parse('6EF8A8FF', radix: 16))])),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:30),
            child: Image.asset('images/thugian.png'),
          ),
          Text("Thư giản",style: AppWidget.highlightTextStyle(),)
        ],
      ),
    );
  }
}
