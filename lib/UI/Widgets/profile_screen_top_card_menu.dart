import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/until/color.dart';

class MenuChoose extends StatefulWidget {
  const MenuChoose({super.key});

  @override
  State<MenuChoose> createState() => _MenuChooseState();
}

class _MenuChooseState extends State<MenuChoose> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierColor: Colors.black54.withOpacity(0.5),
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                alignment: Alignment.bottomCenter,
                insetPadding:
                EdgeInsets.only(left: 0, bottom: 0, right: 0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  height: 290,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Bảng tùy chọn",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed("profileSetting");
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: color.colorWord,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "chỉnh sửa thông tin cá nhân",
                              style: TextStyle(
                                  color: color.colorWord, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.key,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "Đổi mật khẩu",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.trash_fill,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "Xóa tài khoản này",
                            style: TextStyle(
                                color: Colors.red, fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.share,
                            color: color.colorPrimary,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "Chia sẽ ứng dụng",
                            style: TextStyle(
                                color: color.colorPrimary,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: color.colorPrimary,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "Đăng xuất",
                            style: TextStyle(
                                color: color.colorPrimary,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        );
      },
      child: Container(
        height: 50,
        width: 50,
        color: color.colorPrimary,
        child: Icon(
          CupertinoIcons.ellipsis_vertical,
          color: Colors.white,
        ),
      ),
    );
  }
}
