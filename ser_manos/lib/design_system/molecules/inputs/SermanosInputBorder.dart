import 'package:flutter/material.dart';
import '../../tokens/colours/colours.dart';

class SermanosInputBorder {
  const SermanosInputBorder(this.inputBorder); 

  final InputBorder inputBorder;

  SermanosInputBorder.enabled()
      : this(const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: SermanosColors.neutral75,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ));
}
