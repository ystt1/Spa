import 'package:flutter/material.dart';
import 'package:tbdd/until/color.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback ontap;

  const ButtonWidget({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.colorPrimary, // Màu nền của nút
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(10), // Khoảng cách bên trong nút
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
