import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';

class SermanosCircularProgressIndicator extends StatelessWidget {
  const SermanosCircularProgressIndicator({
    super.key,
    this.width = 60,
    this.height = 60,
    this.color = SermanosColors.primary100,
  });

  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
