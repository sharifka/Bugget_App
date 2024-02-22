// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget({
    Key? key,
    this.onTap,
    this.items,
    this.onChanged,
    this.value,
    this.margin,
    this.padding,
  }) : super(key: key);
  final void Function()? onTap;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  final Object? value;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        border: Border.all(color: Colors.blue, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          onTap: onTap,
          // dropdownColor: Colors.white,
          // focusColor: Colors.white,
          isExpanded: true,
          // icon: Icon(Icons.arrow_downward),
          items: items,
          onChanged: onChanged,
          value: value,
        ),
      ),
    );
  }
}
