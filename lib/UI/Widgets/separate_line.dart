import 'package:flutter/material.dart';

class SeparateLine extends StatefulWidget {
  final double width;
  const SeparateLine({super.key, required this.width});

  @override
  State<SeparateLine> createState() => _SeparateLineState();
}

class _SeparateLineState extends State<SeparateLine> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width,
        height: 0.5,
        decoration: const BoxDecoration(color: Colors.black26),
      ),
    );
  }
}
