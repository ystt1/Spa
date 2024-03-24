import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tbdd/Pages/IntroductionPages/Page_1.dart';
import 'package:tbdd/Pages/IntroductionPages/Page_2.dart';
import 'package:tbdd/Pages/IntroductionPages/Page_3.dart';
import 'package:tbdd/Pages/Login.dart';

class Introduce extends StatefulWidget {
  Introduce({super.key});

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  PageController _pageController = new PageController();

  bool onLastPage = false;

  opacity4skipbtn() {
    if (onLastPage) return 0.0;
    return 1.0;
  }

  nextOrDoneButton() {
    return onLastPage
        ? GestureDetector(
            child: const Text(
              'Xong',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LogInPage();
              }))
            },
          )
        : GestureDetector(
            child: const Text('Tiếp', style: TextStyle(fontSize: 20)),
            onTap: () => {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceIn)
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          controller: _pageController,
          children: const [
            PageIntroduce1(),
            PageIntroduce2(),
            PageIntroduce3(),
          ],
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Opacity(
                      opacity: opacity4skipbtn(),
                      child:
                          const Text('Bỏ qua', style: TextStyle(fontSize: 20)),
                    ),
                    onTap: () => {_pageController.jumpToPage(2)},
                  ),
                  SmoothPageIndicator(controller: _pageController, count: 3),
                  nextOrDoneButton()
                ]))
      ],
    ));
  }
}
