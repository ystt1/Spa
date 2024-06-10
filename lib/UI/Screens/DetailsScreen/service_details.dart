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
          id: '0-0',
          imgUrl: 'https://oakwell.com/wp-content/uploads/2023/12/waxing1.jpg',
          name: 'ERROR',
          duration: 'ERROR',
          detail: 'ERROR',
          isHighlight: false,
          price: 20,
          categoryId: '0',
        );
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        titleSpacing: 0,
        title: Text("Service Detail",style: TextStyle(color: CupertinoColors.white),),
        iconTheme: IconThemeData(color: CupertinoColors.white),
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
                  Image(image: NetworkImage(ser.imgUrl)),
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
                  Container(
                    alignment: Alignment.topLeft,
                      child: Text(ser.detail))
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
