import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tbdd/until/color.dart';

import '../../../Models/Service.dart';

class ServiceDetails extends StatefulWidget {
  final Service? service;
  const ServiceDetails({super.key, required this.service});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  late Service ser;

  @override
  void initState() {
    super.initState();
    ser = widget.service ??
        Service(
          id: 404,
          name: 'ERROR',
          duration: '00 minutes',
          details: 'ERROR',
          imageUrl:
              'https://thumbs.dreamstime.com/b/error-rubber-stamp-word-error-inside-illustration-109026446.jpg',
        );
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        title: Text(
          "Chi tiết dịch vụ",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[ Card(
            elevation: 1,
            child: Container(
              color: Colors.white,
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 5 / 6.6),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Image(image: NetworkImage(ser.imageUrl)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ser.name,
                    style: TextStyle(
                        fontSize: 27,
                        color: color.colorWord,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [Icon(CupertinoIcons.time), Text(" ${ser.duration}")],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(ser.details)
                ],
              ),
            ),
          ),
            Container(
              color: CupertinoColors.extraLightBackgroundGray,
              height: 50,

                  child: Center(
                    child: Container(
                      height: 50,
                      width: 100,
                      child: Card(
                        elevation: 10,
                        color: color.colorPrimary,
                        child: Center(child: Text("Đặt lịch",style: TextStyle(color: CupertinoColors.white),)),
                      ),
                    ),
                  ),
                ),
          

          ]
        ),
      ),
    );
  }
}
