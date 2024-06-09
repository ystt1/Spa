import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                  shape: RoundedRectangleBorder(),
                  alignment: Alignment.bottomCenter,
                  insetPadding: EdgeInsets.only(
                      left: 0, right: 0, bottom: 0),
                  child: Container(
                    color: CupertinoColors.white,
                    height: 150,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: 20, left: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chọn nguồn ảnh",
                          style: TextStyle(
                              color: Colors.grey, fontSize: 17),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                            onTap: (){_pickImageFromGallery();},
                            child: Text(
                              "Từ album ảnh",
                              style: TextStyle(fontSize: 17),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: (){_pickImageFromCamera();},
                          child: Text(
                            "Từ camera",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ));
            });
      },
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: _selectedImage == null
                ? NetworkImage(
                "https://st4.depositphotos.com/14903220/24649/v/1600/depositphotos_246499748-stock-illustration-abstract-sign-avatar-women-icon.jpg")
                : FileImage(_selectedImage!) as ImageProvider,
            backgroundColor: Colors.white,
            radius: 43,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 30,
              width: 30,
              child: GestureDetector(
                onTap: () {
                  _pickImageFromGallery();
                },
                child: Container(
                    padding: EdgeInsets.all(2),
                    color: Colors.black,
                    child: Icon(
                      CupertinoIcons.camera_fill,
                      color: Colors.white,
                      size: 21,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
