// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 5, top: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          // decoration: TextDecoration.underline,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
