import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Widgets/separate_line.dart';
import 'package:tbdd/until/color.dart';

import 'home_screen_contact_us.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  Widget RowWidget(
      {required String txt1, required Widget rightTxt, Function? function}) {
    return GestureDetector(
      onTap: () {
        if (function != null)
          {
            function();
          }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${txt1}:",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          rightTxt
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          RowWidget(
            txt1: "Sinh nhật",
            rightTxt: Row(
              children: [
                Text(
                  "Cập nhật ngày sinh",
                  style: TextStyle(
                      color: color.colorWord,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Icon(
                  CupertinoIcons.pen,
                  color: color.colorWord,
                  size: 25,
                )
              ],
            ),
            function: () {
              context.pushNamed("profileSetting");
            },
          ),
          SizedBox(
            height: 20,
          ),
          SeparateLine(
              width: MediaQuery
                  .of(context)
                  .size
                  .width),
          SizedBox(
            height: 20,
          ),
          RowWidget(
            txt1: "Địa chỉ",
            rightTxt: Row(
              children: [
                Text(
                  "Cập nhật địa chỉ",
                  style: TextStyle(
                      color: color.colorWord,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Icon(
                  CupertinoIcons.pen,
                  color: color.colorWord,
                  size: 25,
                )
              ],
            ),
            function: () {
              context.pushNamed("profileSetting");
            },
          ),
          SizedBox(
            height: 20,
          ),
          SeparateLine(
              width: MediaQuery
                  .of(context)
                  .size
                  .width),
          SizedBox(
            height: 20,
          ),
          RowWidget(
            txt1: "Điểm tích lũy",
            rightTxt: Text("100 điểm",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          SizedBox(
            height: 20,
          ),
          SeparateLine(
              width: MediaQuery
                  .of(context)
                  .size
                  .width),
          SizedBox(
            height: 20,
          ),
          RowWidget(
            txt1: "Hạng",
            rightTxt: Text("Hạng thường",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          SizedBox(
            height: 20,
          ),
          SeparateLine(
              width: MediaQuery
                  .of(context)
                  .size
                  .width),
          SizedBox(
            height: 20,
          ),
          RowWidget(
            txt1: "Email",
            rightTxt: Row(
              children: [
                Text(
                  "Cập nhật email",
                  style: TextStyle(
                      color: color.colorWord,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Icon(
                  CupertinoIcons.pen,
                  color: color.colorWord,
                  size: 25,
                )
              ],
            ),
            function: () {
              context.pushNamed("profileSetting");
            },
          ),
          SizedBox(
            height: 20,
          ),
          SeparateLine(
              width: MediaQuery
                  .of(context)
                  .size
                  .width),
          SizedBox(
            height: 20,
          ),
          ContacsUs()
        ],
      ),
    );
  }
}
