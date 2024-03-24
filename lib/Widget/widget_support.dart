
import 'package:flutter/material.dart';

class AppWidget{
  static TextStyle regularTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Pacifico'
    );
  }

  static TextStyle normalTextStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold,
        fontFamily: 'Pacifico'
    );
  }

  static TextStyle highlightTextStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Pacifico'
    );
  }
}