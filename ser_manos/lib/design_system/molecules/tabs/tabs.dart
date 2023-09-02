import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class Tab extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;

  const Tab(
      {Key? key,
      required this.text,
      required this.color,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      padding: const EdgeInsets.symmetric(
        vertical: 16, 
        horizontal: 8
        ),
      child: Text(
        text, 
        style: const SermanosTypography.body01()
        ),
    );
  }
}
