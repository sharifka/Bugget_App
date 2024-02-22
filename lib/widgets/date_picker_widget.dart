// ignore_for_file: prefer_const_constructors

import 'package:ayuuto_app/widgets/circle_border_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    Key? key,
    required this.data,
    this.onPressed,
  }) : super(key: key);
  final String data;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleBorderWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data,
            style: GoogleFonts.montserrat(fontSize: 25),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.date_range,
              // color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
