import 'package:flutter/material.dart';
import '../../tokens/colours/colours.dart';

class SermanosInputBorder {
  SermanosInputBorder(
      {required double width, required Color color, required double radius})
      : inputBorder = OutlineInputBorder(
            borderSide: BorderSide(width: width, color: color),
            borderRadius: BorderRadius.all(Radius.circular(radius)));

  final InputBorder inputBorder;

  SermanosInputBorder.enabled()
      : this(width: 1, color: SermanosColors.neutral75, radius: 4);

  SermanosInputBorder.focused()
      : this(
          width: 2,
          color: SermanosColors.secondary200,
          radius: 4,
        );

  SermanosInputBorder.error()
      : this(width: 2, color: SermanosColors.error100, radius: 4);

  SermanosInputBorder.disabled()
      : this(
          width: 1,
          color: SermanosColors.neutral50,
          radius: 4,
        );
}
