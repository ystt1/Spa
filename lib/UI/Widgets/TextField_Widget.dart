import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tbdd/until/color.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hinttext;
  final bool type;

  const TextFieldWidget(
      {Key? key,
      required this.hinttext,
      required this.type,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors
                    .grey, // Màu của đường viền khi TextField không được chọn
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: color.colorPrimary,
                // Màu của đường viền khi TextField được chọn
              ),
            ),
          ),
          obscureText: type,
          controller: controller,
        ),
      ),
    );
  }
}
