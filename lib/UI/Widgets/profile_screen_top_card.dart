import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tbdd/until/color.dart';

class TopCard extends StatefulWidget {
  const TopCard({super.key});

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: color.colorPrimary,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned(
              top: 20,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 19,
                      ),
                      Text(
                        " 100 điểm",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.trophy,
                        color: Colors.white,
                        size: 16,
                      ),
                      Text(
                        " Hạng Thường",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              )),
          Positioned(
              top: 25,
              right: 10,
              child: Icon(
                CupertinoIcons.ellipsis_vertical,
                color: Colors.white,
              )),
          Positioned(
              top: 30,
              left: 10,
              right: 10,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 43,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                            padding: EdgeInsets.all(2),
                            color: Colors.black,
                            child: Icon(
                              CupertinoIcons.camera_fill,
                              color: Colors.white,
                              size: 21,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Phan Quốc Tuấn",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_android,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        "0879330171",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              )),
          Positioned(
              right: 10,
              left: 10,
              bottom: 10,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                height: 78,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hạng thường - 100 điểm",
                      style: TextStyle(
                          color: color.colorWord,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 13,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 290,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              value: 0.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  color.colorWord),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            FontAwesomeIcons.trophy,
                            size: 18,
                            color: color.colorWord,
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Còn 100 điểm nữa để lên Hạng Bạc",
                      style: TextStyle(
                          color: color.colorWord,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
