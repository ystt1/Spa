import 'package:flutter/material.dart';

import '../../Widget/widget_support.dart';

class PageIntroduce3 extends StatelessWidget {
  const PageIntroduce3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(int.parse('214C67FF', radix: 16))])),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:30),
            child: Image.asset('images/tanhuong.png'),
          ),
          Text("Tận hưởng",style: AppWidget.highlightTextStyle(),)
        ],
      ),
    );
  }
}
