import 'package:flutter/material.dart';

class WTextfield extends StatelessWidget {
  const WTextfield({
    required this.width,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    required this.hintText,
    required this.controller,
    super.key,
  });

  final TextEditingController controller;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
