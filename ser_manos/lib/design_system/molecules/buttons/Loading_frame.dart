import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class LoadingFrame extends StatelessWidget {
  const LoadingFrame({
    Key? key,
    required this.loading,
    required this.boxColor,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  final bool loading;
  final Color boxColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return loading
        ? SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              color: boxColor,
            ),
          )
        : Text(
            text,
            style: SermanosTypography.button(
              color: textColor,
            ),
          );
  }
}
