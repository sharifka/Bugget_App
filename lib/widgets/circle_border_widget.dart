// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CircleBorderWidget extends StatelessWidget {
  const CircleBorderWidget({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
