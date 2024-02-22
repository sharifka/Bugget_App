// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.labelText,
    this.icon,
    this.suffix,
    required this.obscureText,
    this.controller,
    this.focusNode,
    required this.autofocus,
    this.enabledBorder,
    this.focusedBorder,
    this.color,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    required this.readOnly,
    this.prefixIcon,
    this.hintText,
    this.maxLines,
    this.onChanged,
    this.hintStyle,
  }) : super(key: key);
  final String? labelText;
  final IconData? icon;
  final Widget? suffix;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? color;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final Widget? prefixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLines;
  final void Function(String)? onChanged;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          //  color: Theme.of(context).primaryColor,
          //borderRadius: BorderRadius.circular(10),
          ),
      child: TextField(
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: widget.obscureText,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffix: widget.suffix,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: widget.enabledBorder,
          focusedBorder: widget.focusedBorder,
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.blue),
          // ),
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.blue,
          //   ),
          // ),
          labelText: widget.labelText,
          labelStyle: GoogleFonts.poppins(
            fontSize: 16,
            color: widget.color,
          ),
          hintStyle: widget.hintStyle,
          //prefixIcon: Icon(widget.icon),
        ),
        style: TextStyle(fontSize: 16),
        onChanged: widget.onChanged,
      ),
    );
  }
}
